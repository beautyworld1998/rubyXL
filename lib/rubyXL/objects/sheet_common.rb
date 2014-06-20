require 'rubyXL/objects/ooxml_object'
require 'rubyXL/objects/storage'

module RubyXL

  # http://www.schemacentral.com/sc/ooxml/e-ssml_webPublishItem-1.html
  class WebPublishingItem < OOXMLObject
    define_attribute(:id,              :int,    :required => :true)
    define_attribute(:divId,           :int,    :required => :true)
    define_attribute(:sourceType,      RubyXL::ST_WebSourceType, :required => :true)
    define_attribute(:sourceRef,       :ref)
    define_attribute(:sourceObject,    :string)
    define_attribute(:destinationFile, :string, :required => :true)
    define_attribute(:title,           :string)
    define_attribute(:autoRepublish,   :bool,   :default => false)
    define_element_name 'webPublishItem'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_webPublishItems-1.html
  class WebPublishingItems < OOXMLContainerObject
    define_child_node(RubyXL::WebPublishingItem, :collection => :with_count)
    define_element_name 'webPublishItems'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_pageMargins-1.html
  class PageMargins < OOXMLObject
    define_attribute(:left,   :float, :required => true)
    define_attribute(:right,  :float, :required => true)
    define_attribute(:top,    :float, :required => true)
    define_attribute(:bottom, :float, :required => true)
    define_attribute(:header, :float, :required => true)
    define_attribute(:footer, :float, :required => true)
    define_element_name 'pageMargins'
  end

  # http://www.schemacentral.com/sc/ooxml/e-ssml_headerFooter-1.html
  class HeaderFooterSettings < OOXMLObject
    define_attribute(:differentOddEven, :bool, :default => false)
    define_attribute(:differentFirst,   :bool, :default => false)
    define_attribute(:scaleWithDoc,     :bool, :default => true)
    define_attribute(:alignWithMargins, :bool, :default => true)
    define_child_node(RubyXL::StringValue, :node_name => :oddHeader)
    define_child_node(RubyXL::StringValue, :node_name => :oddFooter)
    define_child_node(RubyXL::StringValue, :node_name => :evenHeader)
    define_child_node(RubyXL::StringValue, :node_name => :evenFooter)
    define_child_node(RubyXL::StringValue, :node_name => :firstHeader)
    define_child_node(RubyXL::StringValue, :node_name => :firstFooter)
    define_element_name 'headerFooter'
  end

end
