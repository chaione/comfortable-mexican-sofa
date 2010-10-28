class CmsTag::FieldText < CmsBlock
  
  include CmsTag
  
  def self.regex_tag_signature(label = nil)
    label ||= /\w+/
    /\{\s*cms:field:(#{label}):?(?:text)?\s*?\}/
  end
  
  def regex_tag_signature
    self.class.regex_tag_signature(label)
  end
  
  def content=(value)
    write_attribute(:content_text, value)
  end
  
  def content
    read_attribute(:content_text)
  end
  
  def render
    ''
  end
  
end