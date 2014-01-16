module RubyXL


  # http://www.schemacentral.com/sc/ooxml/e-ssml_v-1.html
  class CellValue < OOXMLObject
    define_attribute(:_, :string, :accessor => :value)
    define_element_name 'v'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_t-1.html
  class Text < OOXMLObject
    define_attribute(:_, :string, :accessor => :value)
    define_element_name 't'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_is-1.html
  class RichText < OOXMLObject
    define_child_node(RubyXL::Text)               # t
#    define_child_node(RubyXL::RichTextRun)        # r
#    define_child_node(RubyXL::PhoneticRun)        # rPh
#    define_child_node(RubyXL::PhoneticProperties) # phoneticPr
    define_element_name 'is'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_c-2.html
  class Cell < OOXMLObject
    define_attribute(:r,   :ref)
    define_attribute(:s,   :int)
    define_attribute(:t,   :string,  :default => 'n', :values => %w{ b n e s str inlineStr })
    define_attribute(:cm,  :int)
    define_attribute(:vm,  :int)
    define_attribute(:ph,  :bool)
    define_child_node(RubyXL::CellFormula) # f 
    define_child_node(RubyXL::CellValue)   # v
    define_child_node(RubyXL::RichText)    # is
    define_element_name 'c'

    def row
      r && r.first_row
    end

    def row=(v)
      self.r = RubyXL::Reference.new(v, column || 0)
    end

    def column
      r && r.first_col
    end

    def column=(v)
      self.r = RubyXL::Reference.new(row || 0, v)
    end

    def datatype
      t
    end

    def datatype=(v)
      self.t = v
    end

    def style_index
      s
    end

    def style_index=(v)
      self.s = v
    end

#                      cell_value = if (cell.datatype == RubyXL::Cell::SHARED_STRING) then
#                                     @workbook.shared_strings.get_index(cell.value).to_s
#                                   else cell.value
#                                   end

    include LegacyCell
  end

#TODO#<row r="1" spans="1:1" x14ac:dyDescent="0.25">

  # http://www.schemacentral.com/sc/ooxml/e-ssml_row-1.html
  class Row < OOXMLObject
    define_attribute(:r,            :int)
    define_attribute(:spans,        :string)
    define_attribute(:s,            :int)
    define_attribute(:customFormat, :bool,  :default => false)
    define_attribute(:ht,           :float)
    define_attribute(:hidden,       :bool,  :default => false)
    define_attribute(:customHeight, :bool,  :default => false)
    define_attribute(:outlineLevel, :int,   :default => 0)
    define_attribute(:collapsed,    :bool,  :default => false)
    define_attribute(:thickTop,     :bool,  :default => false)
    define_attribute(:thickBot,     :bool,  :default => false)
    define_attribute(:ph,           :bool,  :default => false)
    define_child_node(RubyXL::Cell, :collection => true, :accessor => :cells)
    define_element_name 'row'

    def [](ind)
      cells[ind]
    end

  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_sheetData-1.html
  class SheetData < OOXMLObject
    define_child_node(RubyXL::Row, :collection => true, :accessor => :rows)
    define_element_name 'sheetData'

    def [](ind)
      rows[ind]
    end

  end

end
