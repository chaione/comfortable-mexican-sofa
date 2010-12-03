class CmsTag::Partial
  
  attr_accessor :label
  
  include CmsTag
  
  def self.regex_tag_signature(label = nil)
    label ||= /[\w\/\-]+/
    /\{\{\s*cms:partial:(#{label}):?(.*?)\s*\}\}/
  end
  
  def regex_tag_signature
    self.class.regex_tag_signature(label)
  end
  
  def content
    ps = params.split(':').collect_with_index{|p, i| ":param_#{i+1} => '#{p}'"}.join(', ')
    "<%= render :partial => '#{label}'#{ps.blank?? nil : ", :locals => {#{ps}}"} %>"
  end
  
end