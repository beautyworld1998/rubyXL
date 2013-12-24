require 'rubygems'
require 'nokogiri'
require 'zip'
require 'rubyXL/hash'
require 'rubyXL/generic_storage'

module RubyXL

  class Parser
    attr_reader :data_only, :num_sheets

    # +:data_only+ allows only the sheet data to be parsed, so as to speed up parsing
    # However, using this option will result in date-formatted cells being interpreted as numbers
    def Parser.parse(file_path, opts = {})

      # options handling
      @data_only = opts.is_a?(TrueClass)||!!opts[:data_only]
      skip_filename_check = !!opts[:skip_filename_check]

      files = Parser.decompress(file_path, skip_filename_check)
      wb = Parser.fill_workbook(file_path, files)

      shared_string_file = files['sharedString']
      unless shared_string_file.nil?
        sst = shared_string_file.css('sst')

        # According to http://msdn.microsoft.com/en-us/library/office/gg278314.aspx,
        # these attributes may be either both missing, or both present. Need to validate.
        wb.shared_strings.count_attr = sst.attribute('count').value.to_i
        wb.shared_strings.unique_count_attr = sst.attribute('uniqueCount').value.to_i

        # Note that the strings may contain text formatting, such as changing font color/properties
        # in the middle of the string. We do not support that in this gem... at least yet!
        # If you save the file, this formatting will be destoyed.
        shared_string_file.css('si').each_with_index { |node, i|
          wb.shared_strings.add(node.css('t').inject(''){ |s, c| s + c.text }, i)
        }

      end
      #styles are needed for formatting reasons as that is how dates are determined
      styles = files['styles'].css('cellXfs xf')
      style_hash = Hash.xml_node_to_hash(files['styles'].root)

      fills = files['styles'].css('fills fill')
      wb.fills = fills.collect { |node| RubyXL::Fill.parse(node) }

      colors = files['styles'].css('colors').first

      if colors then
        colors.element_children.each { |color_type_node|
          wb.colors[color_type_node.name] ||= []
          color_type_node.element_children.each { |color_node|
            wb.colors[color_type_node.name] << RubyXL::Color.parse(color_node)
          }
        }
      end

      fill_styles(wb,style_hash)

      wb.external_links = files['externalLinks']
      wb.external_links_rels = files['externalLinksRels']
      wb.drawings = files['drawings']
      wb.printer_settings = files['printerSettings']
      wb.worksheet_rels = files['worksheetRels']
      wb.macros = files['vbaProject']
      wb.theme = files['theme']

      sheet_names = files['app'].css('TitlesOfParts vt|vector vt|lpstr').children
      files['workbook'].css('sheets sheet').each_with_index { |sheet_node, i|
        Parser.parse_worksheet(wb, i, files['worksheets'][i], sheet_names[i].text,
                               sheet_node.attributes['sheetId'].value )
      }

      return wb
    end

    private

    #fills hashes for various styles
    def Parser.fill_styles(wb,style_hash)
      ###NUM FORMATS###
      if style_hash[:numFmts].nil?
        style_hash[:numFmts] = {:attributes => {:count => 0}, :numFmt => []}
      elsif style_hash[:numFmts][:attributes][:count]==1
        style_hash[:numFmts][:numFmt] = [style_hash[:numFmts][:numFmt]]
      end
      wb.num_fmts = style_hash[:numFmts]

      ###FONTS###
      wb.fonts = {}
      if style_hash[:fonts][:attributes][:count]==1
        style_hash[:fonts][:font] = [style_hash[:fonts][:font]]
      end

      style_hash[:fonts][:font].each_with_index do |f,i|
        wb.fonts[i.to_s] = {:font=>f,:count=>0}
      end

      ###BORDERS###
      wb.borders = {}
      if style_hash[:borders][:attributes][:count] == 1
        style_hash[:borders][:border] = [style_hash[:borders][:border]]
      end

      style_hash[:borders][:border].each_with_index do |b,i|
        wb.borders[i.to_s] = {:border=>b, :count=>0}
      end

      wb.cell_style_xfs = style_hash[:cellStyleXfs]
      wb.cell_xfs = style_hash[:cellXfs]
      wb.cell_styles = style_hash[:cellStyles]

      #fills out count information for each font, fill, and border
      if wb.cell_xfs[:xf].is_a?(::Hash)
        wb.cell_xfs[:xf] = [wb.cell_xfs[:xf]]
      end

      wb.cell_xfs[:xf].each do |style|
        id = style[:attributes][:fontId].to_s
        unless id.nil?
          wb.fonts[id][:count] += 1
        end

        id = style[:attributes][:fillId]
        unless id.nil?
          wb.fills[id].count += 1
        end

        id = style[:attributes][:borderId].to_s
        unless id.nil?
          wb.borders[id][:count] += 1
        end
      end
    end

    # Parse the incoming +worksheet_xml+ into a new +Worksheet+ object 
    def Parser.parse_worksheet(wb, i, worksheet_xml, worksheet_name, sheet_id)
      worksheet = Worksheet.new(wb, worksheet_name)
      wb.worksheets[i] = worksheet # Due to "validate_workbook" issues. Should remove that validation eventually.
      worksheet.sheet_id = sheet_id

      dimensions = worksheet_xml.css('dimension').attribute('ref').to_s
      raise 'Unable to determine worksheet dimensions' unless (dimensions =~ /^([A-Z]+\d+:)?([A-Z]+\d+)$/)
      rows, cols = Cell.ref2ind($2)
      # Create empty arrays for workcells. Using +downto()+ here so memory for +sheet_data[]+ is
      # allocated on the first iteration (in case of +upto()+, +sheet_data[]+ would end up being
      # reallocated on every iteration).
      rows.downto(0) { |i| worksheet.sheet_data[i] = Array.new(cols + 1) }

      namespaces = worksheet_xml.root.namespaces

      unless @data_only
        sheet_views_node = worksheet_xml.xpath('/xmlns:worksheet/xmlns:sheetViews[xmlns:sheetView]', namespaces).first
        worksheet.sheet_view = Hash.xml_node_to_hash(sheet_views_node)[:sheetView]

        col_node_set = worksheet_xml.xpath('/xmlns:worksheet/xmlns:cols/xmlns:col',namespaces)
        worksheet.column_ranges = col_node_set.collect { |col_node| RubyXL::ColumnRange.new(col_node.attributes) }

        merged_cells_nodeset = worksheet_xml.xpath('/xmlns:worksheet/xmlns:mergeCells/xmlns:mergeCell', namespaces)
        worksheet.merged_cells = merged_cells_nodeset.collect { |child| child.attributes['ref'].text }

        worksheet.pane = worksheet.sheet_view[:pane]

        ##data_validation##
        data_validations_node = worksheet_xml.xpath('/xmlns:worksheet/xmlns:dataValidations[xmlns:dataValidation]', namespaces)
        unless data_validations_node.empty?
          worksheet.validations = Hash.xml_node_to_hash(data_validations_node.first)[:dataValidation]
        else
          worksheet.validations = nil
        end
        ##end data_validation##

        #extLst
        ext_list_node = worksheet_xml.xpath('/xmlns:worksheet/xmlns:extLst', namespaces)
        unless ext_list_node.empty?
          worksheet.extLst = Hash.xml_node_to_hash(ext_list_node.first)
        else
          worksheet.extLst = nil
        end
        #extLst

        ##legacy drawing##
        legacy_drawing_node = worksheet_xml.xpath('/xmlns:worksheet/xmlns:legacyDrawing', namespaces)
        unless legacy_drawing_node.empty?
          worksheet.legacy_drawing = Hash.xml_node_to_hash(legacy_drawing_node.first)
        else
          worksheet.legacy_drawing = nil
        end
        ##end legacy drawing

        drawing_nodes = worksheet_xml.xpath('/xmlns:worksheet/xmlns:drawing', namespaces)
        worksheet.drawings = drawing_nodes.collect { |n| n.attributes['id'] }
      end

      row_data = worksheet_xml.xpath('/xmlns:worksheet/xmlns:sheetData/xmlns:row[xmlns:c[xmlns:v]]', namespaces)
      row_data.each do |row|
        unless @data_only
          ##row styles##
          row_style = '0'
          row_attributes = row.attributes
          unless row_attributes['s'].nil?
            row_style = row_attributes['s'].value
          end

          worksheet.row_styles[row_attributes['r'].content] = { :style => row_style  }

          if !row_attributes['ht'].nil?  && (!row_attributes['ht'].content.nil? || row_attributes['ht'].content.strip != "" )
            worksheet.change_row_height(Integer(row_attributes['r'].content)-1,
              Float(row_attributes['ht'].content))
          end
          ##end row styles##
        end
        unless @data_only
          c_row = row.search('./xmlns:c')
        else
          c_row = row.search('./xmlns:c[xmlns:v[text()]]')
        end
        c_row.each do |value|
          #attributes is from the excel cell(c) and is basically location information and style and type
          value_attributes= value.attributes
          # r attribute contains the location like A1
          cell_index = Cell.ref2ind(value_attributes['r'].content)
          style_index = 0
          # t is optional and contains the type of the cell
          data_type = value_attributes['t'].content if value_attributes['t']
          element_hash ={}
          value.children.each do |node|
            element_hash["#{node.name()}_element"]=node
          end
          # v is the value element that is part of the cell
          if element_hash["v_element"]
            v_element_content = element_hash["v_element"].content
          else
            v_element_content=""
          end
          if v_element_content == "" # no data
            cell_data = nil
          elsif data_type == RubyXL::Cell::SHARED_STRING
            str_index = Integer(v_element_content)
            cell_data = wb.shared_strings[str_index].to_s
          elsif data_type == RubyXL::Cell::RAW_STRING
            cell_data = v_element_content
          elsif data_type == RubyXL::Cell::ERROR
            cell_data = v_element_content
          else# (value.css('v').to_s != "") && (value.css('v').children.to_s != "") #is number
            data_type = ''
            if(v_element_content =~ /\./ or v_element_content =~ /\d+e\-?\d+/i) #is float
              cell_data = Float(v_element_content)
            else
              cell_data = Integer(v_element_content)
            end
          end

          # f is the formula element
          cell_formula = nil
          fmla_css = element_hash["f_element"]
          if fmla_css && fmla_css.content
            fmla_css_content= fmla_css.content
            if(fmla_css_content != "")
              cell_formula = fmla_css_content
              cell_formula_attr = {}
              fmla_css_attributes = fmla_css.attributes
              cell_formula_attr['t'] = fmla_css_attributes['t'].content if fmla_css_attributes['t']
              cell_formula_attr['ref'] = fmla_css_attributes['ref'].content if fmla_css_attributes['ref']
              cell_formula_attr['si'] = fmla_css_attributes['si'].content if fmla_css_attributes['si']
            end
          end

          style_index = value['s'].to_i #nil goes to 0 (default)

          worksheet.sheet_data[cell_index[0]][cell_index[1]] =
            Cell.new(worksheet,cell_index[0],cell_index[1],cell_data,cell_formula,
              data_type,style_index,cell_formula_attr)
          cell = worksheet.sheet_data[cell_index[0]][cell_index[1]]
        end
      end

      worksheet
    end

    def Parser.decompress(file_path, skip_filename_check = false)
      #ensures it is an xlsx/xlsm file
      if(file_path =~ /(.+)\.xls(x|m)/)
        dir_path = $1.to_s
      else
        if skip_filename_check
          dir_path = file_path
        else
          raise 'Not .xlsx or .xlsm excel file'
        end
      end

      dir_path = File.join(File.dirname(dir_path), make_safe_name(Time.now.to_s))
      #copies excel file to zip file in same directory
      zip_path = dir_path + '.zip'

      FileUtils.cp(file_path,zip_path)

      MyZip.new.unzip(zip_path,dir_path)
      File.delete(zip_path)

      files = Hash.new

      files['app'] = Nokogiri::XML.parse(File.open(File.join(dir_path,'docProps','app.xml'),'r'))
      files['core'] = Nokogiri::XML.parse(File.open(File.join(dir_path,'docProps','core.xml'),'r'))
      files['workbook'] = Nokogiri::XML.parse(File.open(File.join(dir_path,'xl','workbook.xml'),'r'))
      files['workbook_rels'] = Nokogiri::XML.parse(File.open(File.join(dir_path, 'xl', '_rels', 'workbook.xml.rels'), 'r'))

      if(File.exist?(File.join(dir_path,'xl','sharedStrings.xml')))
        files['sharedString'] = Nokogiri::XML.parse(File.open(File.join(dir_path,'xl','sharedStrings.xml'),'r'))
      end

      unless @data_only
        files['externalLinks'] = RubyXL::GenericStorage.new(File.join('xl', 'externalLinks')).load_dir(dir_path)
        files['externalLinksRels'] = RubyXL::GenericStorage.new(File.join('xl', 'externalLinks', '_rels')).load_dir(dir_path)
        files['drawings'] = RubyXL::GenericStorage.new(File.join('xl', 'drawings')).load_dir(dir_path)
        files['printerSettings'] = RubyXL::GenericStorage.new(File.join('xl', 'printerSettings')).binary.load_dir(dir_path)
        files['worksheetRels'] = RubyXL::GenericStorage.new(File.join('xl', 'worksheets', '_rels')).load_dir(dir_path)
        files['vbaProject'] = RubyXL::GenericStorage.new('xl').binary.load_file(dir_path, 'vbaProject.bin')
        files['theme'] = RubyXL::GenericStorage.new(File.join('xl', 'theme')).load_file(dir_path, 'theme1.xml')
      end

      files['styles'] = Nokogiri::XML.parse(File.open(File.join(dir_path,'xl','styles.xml'),'r'))

      files['worksheets'] = []
      rels_doc = files['workbook_rels']

      files['workbook'].css('sheets sheet').each_with_index { |sheet, ind|
        sheet_rid = sheet.attributes['id'].value 
        sheet_file_path = rels_doc.css("Relationships Relationship[Id=#{sheet_rid}]").first.attributes['Target']
        files['worksheets'][ind] = Nokogiri::XML.parse(File.read(File.join(dir_path, 'xl', sheet_file_path)))
      }

      FileUtils.rm_rf(dir_path)

      return files
    end

    def Parser.fill_workbook(file_path, files)
      wb = Workbook.new([nil], file_path)

      unless @data_only
        wb.creator = files['core'].css('dc|creator').children.to_s
        wb.modifier = files['core'].css('cp|last_modified_by').children.to_s
        wb.created_at = files['core'].css('dcterms|created').children.to_s
        wb.modified_at = files['core'].css('dcterms|modified').children.to_s

        wb.company = files['app'].css('Company').children.to_s
        wb.application = files['app'].css('Application').children.to_s
        wb.appversion = files['app'].css('AppVersion').children.to_s
      end

      wb.shared_strings_XML = files['sharedString'].to_s
      wb.defined_names = files['workbook'].css('definedNames').to_s
      wb.date1904 = files['workbook'].css('workbookPr').attribute('date1904').to_s == '1'

      wb.worksheets = []
      wb
    end

    def Parser.safe_filename(name, allow_mb_chars=false)
      # "\w" represents [0-9A-Za-z_] plus any multi-byte char
      regexp = allow_mb_chars ? /[^\w]/ : /[^0-9a-zA-Z\_]/
      name.gsub(regexp, "_")
    end

    # Turns the passed in string into something safe for a filename
    def Parser.make_safe_name(name, allow_mb_chars=false)
      ext = safe_filename(File.extname(name), allow_mb_chars).gsub(/^_/, '.')
      "#{safe_filename(name.gsub(ext, ""), allow_mb_chars)}#{ext}".gsub(/\(/, '_').gsub(/\)/, '_').gsub(/__+/, '_').gsub(/^_/, '').gsub(/_$/, '')
    end

    def self.attr_int(node, attr_name) 
      attr = node.attributes[attr_name]
      attr && Integer(attr.value)
    end

    def self.attr_float(node, attr_name) 
      attr = node.attributes[attr_name]
      attr && Float(attr.value)
    end

    def self.attr_string(node, attr_name) 
      attr = node.attributes[attr_name]
      attr && attr.value
    end

  end
end

