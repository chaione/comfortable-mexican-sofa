class ComfortableMexicanSofa::Tag::FieldDateTime
  include ComfortableMexicanSofa::Tag
  
  def self.regex_tag_signature(identifier = nil)
    identifier ||= /[\w\-]+/
    /\{\{\s*cms:field:(#{identifier}):datetime\s*\}\}/
  end
  
  def content
    block.content
  end
  
  def render
    ''
  end
  
end