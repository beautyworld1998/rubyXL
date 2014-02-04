require 'rubygems'
require 'nokogiri'
require 'zip'
require 'rubyXL/generic_storage'

module RubyXL

  class Parser
    def self.parse(file_path, opts = {})
      self.new(opts).parse(file_path)
    end

    # +:data_only+ allows only the sheet data to be parsed, so as to speed up parsing
    # However, using this option will result in date-formatted cells being interpreted as numbers
    def initialize(opts = {})
      @data_only = opts.is_a?(TrueClass) || opts[:data_only]
      @skip_filename_check = opts[:skip_filename_check]
    end

    def data_only
      @data_only = true
      self
    end

    def parse(file_path, opts = {})
      raise 'Not .xlsx or .xlsm excel file' unless @skip_filename_check ||
                                              %w{.xlsx .xlsm}.include?(File.extname(file_path))

      dir_path = File.join(File.dirname(file_path), Dir::Tmpname.make_tmpname(['rubyXL', '.tmp'], nil))

      MyZip.new.unzip(file_path, dir_path)

      workbook_file = Nokogiri::XML.parse(File.open(File.join(dir_path, 'xl', 'workbook.xml'), 'r'))

      wb = RubyXL::Workbook.parse(workbook_file)
      wb.filepath = file_path

      rels_doc = Nokogiri::XML.parse(File.open(File.join(dir_path, 'xl', '_rels', 'workbook.xml.rels'), 'r'))

      shared_strings_path = File.join(dir_path, 'xl', 'sharedStrings.xml')
      if File.exist?(shared_strings_path) then
        wb.shared_strings_container = RubyXL::SharedStringsTable.parse(File.open(shared_strings_path, 'r'))
      end

      unless @data_only
        wb.media = RubyXL::GenericStorage.new(File.join('xl', 'media')).binary.load_dir(dir_path)
        wb.external_links = RubyXL::GenericStorage.new(File.join('xl', 'externalLinks')).load_dir(dir_path)
        wb.external_links_rels = RubyXL::GenericStorage.new(File.join('xl', 'externalLinks', '_rels')).load_dir(dir_path)
        wb.drawings = RubyXL::GenericStorage.new(File.join('xl', 'drawings')).load_dir(dir_path)
        wb.drawings_rels = RubyXL::GenericStorage.new(File.join('xl', 'drawings', '_rels')).load_dir(dir_path)
        wb.charts = RubyXL::GenericStorage.new(File.join('xl', 'charts')).load_dir(dir_path)
        wb.chart_rels = RubyXL::GenericStorage.new(File.join('xl', 'charts', '_rels')).load_dir(dir_path)
        wb.printer_settings = RubyXL::GenericStorage.new(File.join('xl', 'printerSettings')).binary.load_dir(dir_path)
        wb.worksheet_rels = RubyXL::GenericStorage.new(File.join('xl', 'worksheets', '_rels')).load_dir(dir_path)
        wb.macros = RubyXL::GenericStorage.new('xl').binary.load_file(dir_path, 'vbaProject.bin')
        wb.theme = RubyXL::GenericStorage.new(File.join('xl', 'theme')).load_file(dir_path, 'theme1.xml')

        core_file = Nokogiri::XML.parse(File.open(File.join(dir_path, 'docProps', 'core.xml'), 'r'))
        wb.creator = core_file.css('dc|creator').children.to_s
        wb.modifier = core_file.css('cp|last_modified_by').children.to_s
        wb.created_at = core_file.css('dcterms|created').children.to_s
        wb.modified_at = core_file.css('dcterms|modified').children.to_s

        wb.document_properties = RubyXL::DocumentProperties.parse(File.open(File.join(dir_path, 'docProps', 'app.xml'), 'r'))

      end

      wb.stylesheet = RubyXL::Stylesheet.parse(File.open(File.join(dir_path, 'xl', 'styles.xml'), 'r'))

      #fills out count information for each font, fill, and border
      wb.cell_xfs.each { |style|
        id = style.font_id
        wb.fonts[id].count += 1 #unless id.nil?

        id = style.fill_id
        wb.fills[id].count += 1 #unless id.nil?

        id = style.border_id
        wb.borders[id].count += 1 #unless id.nil?
      }

      wb.worksheet_container.sheets.each_with_index { |sheet, i|
        sheet_file_path = rels_doc.css("Relationships Relationship[Id=#{sheet.r_id}]").first.attributes['Target']
        worksheet = RubyXL::Worksheet.parse(File.open(File.join(dir_path, 'xl', sheet_file_path)))
        worksheet.sheet_data.rows.each { |r| r && r.cells.each { |c| c.worksheet = worksheet unless c.nil? } }
        worksheet.workbook = wb
        worksheet.sheet_name = sheet.name
        worksheet.sheet_id = sheet.sheet_id
        wb.worksheets[i] = worksheet
      }

      FileUtils.remove_entry_secure(dir_path)

      return wb
    end

  end
end
