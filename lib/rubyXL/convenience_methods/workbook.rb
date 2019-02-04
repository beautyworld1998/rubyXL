module RubyXL

  module WorkbookConvenienceMethods
    SHEET_NAME_TEMPLATE = 'Sheet%d'

    # Finds worksheet by its name or numerical index
    def [](ind)
      case ind
      when Integer then worksheets[ind]
      when String  then worksheets.find { |ws| ws.sheet_name == ind }
      end
    end

    # Create new simple worksheet and add it to the workbook worksheets
    #
    # @param [String] The name for the new worksheet
    def add_worksheet(name = nil)
      if name.nil? then
        n = 0

        begin
          name = SHEET_NAME_TEMPLATE % (n += 1)
        end until self[name].nil?
      end

      new_worksheet = Worksheet.new(:workbook => self, :sheet_name => name)
      worksheets << new_worksheet
      new_worksheet
    end

    def each
      worksheets.each{ |i| yield i }
    end

    def date1904
      workbook_properties && workbook_properties.date1904
    end

    def date1904=(v)
      self.workbook_properties ||= RubyXL::WorkbookProperties.new
      workbook_properties.date1904 = v
    end

    def company
      root.document_properties.company && root.document_properties.company.value
    end

    def company=(v)
      root.document_properties.company ||= StringNode.new
      root.document_properties.company.value = v
    end

    def application
      root.document_properties.application && root.document_properties.application.value
    end

    def application=(v)
      root.document_properties.application ||= StringNode.new
      root.document_properties.application.value = v
    end

    def appversion
      root.document_properties.app_version && root.document_properties.app_version.value
    end

    def appversion=(v)
      root.document_properties.app_version ||= StringNode.new
      root.document_properties.app_version.value = v
    end

    def creator
      root.core_properties.creator
    end

    def creator=(v)
      root.core_properties.creator = v
    end

    def modifier
      root.core_properties.modifier
    end

    def modifier=(v)
      root.core_properties.modifier = v
    end

    def created_at
      root.core_properties.created_at
    end

    def created_at=(v)
      root.core_properties.created_at = v
    end

    def modified_at
      root.core_properties.modified_at
    end

    def modified_at=(v)
      root.core_properties.modified_at = v
    end

    def cell_xfs # Stylesheet should be pre-filled with defaults on initialize()
      stylesheet.cell_xfs
    end

    def fonts # Stylesheet should be pre-filled with defaults on initialize()
      stylesheet.fonts
    end

    def fills # Stylesheet should be pre-filled with defaults on initialize()
      stylesheet.fills
    end

    def borders # Stylesheet should be pre-filled with defaults on initialize()
      stylesheet.borders
    end

    def get_fill_color(xf)
      fill = fills[xf.fill_id]
      pattern = fill && fill.pattern_fill
      color = pattern && pattern.fg_color
      color = color && color.get_rgb(self)
      color && color.to_s || 'ffffff'
    end

    def register_new_fill(new_fill, old_xf)
      new_xf = old_xf.dup
      new_xf.apply_fill = true
      new_xf.fill_id = fills.find_index { |x| x == new_fill } # Reuse existing fill, if it exists
      new_xf.fill_id ||= fills.size # If this fill has never existed before, add it to collection.
      fills[new_xf.fill_id] = new_fill
      new_xf
    end

    def register_new_font(new_font, old_xf)
      new_xf = old_xf.dup
      new_xf.font_id = fonts.find_index { |x| x == new_font } # Reuse existing font, if it exists
      new_xf.font_id ||= fonts.size # If this font has never existed before, add it to collection.
      fonts[new_xf.font_id] = new_font
      new_xf.apply_font = true
      new_xf
    end

    def register_new_xf(new_xf)
      new_xf_id = cell_xfs.find_index { |xf| xf == new_xf } # Reuse existing XF, if it exists
      new_xf_id ||= cell_xfs.size # If this XF has never existed before, add it to collection.
      cell_xfs[new_xf_id] = new_xf
      new_xf_id
    end

    def modify_alignment(style_index, &block)
      old_xf = cell_xfs[style_index || 0]
      new_xf = old_xf.dup
      if old_xf.alignment then
        new_xf.alignment = old_xf.alignment.dup
      else
        new_xf.alignment = RubyXL::Alignment.new
      end

      yield(new_xf.alignment)
      new_xf.apply_alignment = true

      register_new_xf(new_xf)
    end

    def modify_fill(style_index, rgb)
      xf = cell_xfs[style_index || 0].dup
      new_fill = RubyXL::Fill.new(:pattern_fill =>
                   RubyXL::PatternFill.new(:pattern_type => 'solid',
                                           :fg_color => RubyXL::Color.new(:rgb => rgb)))
      register_new_xf(register_new_fill(new_fill, xf))
    end

    def modify_border(style_index, direction, weight)
      xf = cell_xfs[style_index || 0].dup
      new_border = borders[xf.border_id || 0].dup

      edge = new_border.send(direction)
      new_border.send("#{direction}=", edge.dup) if edge

      new_border.set_edge_style(direction, weight)

      xf.border_id = borders.find_index { |x| x == new_border } # Reuse existing border, if it exists
      xf.border_id ||= borders.size # If this border has never existed before, add it to collection.
      borders[xf.border_id] = new_border
      xf.apply_border = true

      register_new_xf(xf)
    end

    def modify_border_color(style_index, direction, color)
      xf = cell_xfs[style_index || 0].dup
      new_border = borders[xf.border_id || 0].dup
      new_border.set_edge_color(direction, color)

      xf.border_id = borders.find_index { |x| x == new_border } # Reuse existing border, if it exists
      xf.border_id ||= borders.size # If this border has never existed before, add it to collection.
      borders[xf.border_id] = new_border
      xf.apply_border = true

      register_new_xf(xf)
    end

    # Calculate password hash from string for use in 'password' fields.
    # https://www.openoffice.org/sc/excelfileformat.pdf
    def password_hash(pwd)
      hsh = 0
      pwd.reverse.each_char { |c|
        hsh = hsh ^ c.ord
        hsh = hsh << 1
        hsh -= 0x7fff if hsh > 0x7fff
      }

      (hsh ^ pwd.length ^ 0xCE4B).to_s(16)
    end

    def define_new_name(name, reference)
      self.defined_names ||= RubyXL::DefinedNames.new
      self.defined_names << RubyXL::DefinedName.new({:name => name, :reference => reference})
    end

    def get_defined_name(name)
      self.defined_names && self.defined_names.find { |n| n.name == name }
    end

  end

  RubyXL::Workbook.include(RubyXL::WorkbookConvenienceMethods)
end
