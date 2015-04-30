
require 'socket'

def remove_section(html, first, last)
  idx = html.index(first)
  return html if idx.nil?
  endidx = html.index(last, idx) + last.size
  html = "#{html[0..(idx-1)]}#{html[endidx..(html.size)]}"
end

def find_publish_on_date(str, pdate)
  startidx = str.index("<div class=\"publish_on\">")
  endidx = str.index("</div>", startidx)
  startidx += "<div class=\"publish_on\">".size
  endidx -= 1
  ret = str[startidx..endidx]
  ret.gsub!('<', '')
  ret.gsub!('>', '')
  ret.strip!
  if not ret.index(':').nil?
    s = ret.index(':') - 3
    str = ret[0..s]
    str.strip!
  end
  return str
end


def convert_page(cms_page) 

  # categories to tabs
  tags_before = cms_page.categories.map(&:label)
  tags = []
  tags_before.each do |tag|
    tags << tag if not tag =~ /location/
  end
  
  # html
  html = cms_page.content_cache
  
  # youtube
  idx = html.index('<div class="video-container">')
  endidx = html.index('</div>', idx) + '</div>'.size
  srcidx = html.index('src="', idx) + 'src="'.size
  endsrcidx = html.index('"', srcidx)
  if endsrcidx - srcidx < 7
    html = remove_section(html, '<div class="video-container">', '</div>')
  end
  
  # content
  idx = html.index('<div class="body_content">') + '<div class="body_content">'.size
  endidx = html.index('</div>', idx)
  body = html[(idx+1)..(endidx-1)]
  body = "<p>#{body}"
  body.gsub!("\r\n\r\n", "<p />")
  body.gsub!("\r\n", '<br /><p />')
  html = "#{html[0..(idx-1)]}#{body}#{html[endidx..(html.size)]}</p>"
  
  # images
  idx = html.index('nss_images')
  idx = html.index(">", idx)
  endidx = html.index('</ul>', idx)
  image_str = html[(idx+1)..(endidx-1)]
  image_str.strip!
  image_str.gsub!(',', ' ')
  imgs = image_str.split(' ')
  if imgs.size == 0
    html = remove_section(html, '<section id="thumb-gallery"', '</section>')
  else
    hostname = "newsstand.nblenergy.com"
    imgs.each do |img|
      img.strip!
      original_image = img
      logger.error("IMAGE: original image #{img}")
        if img =~ /\A\/?images/
          img = "http://#{hostname}/#{img}"
          logger.error("IMAGE: #{img} from #{original_image}")
        elsif img =~ /amazon/
          logger.error("IMAGE: AWS")
          img.sub!("http://s3.amazonaws.com/noble-news-stand-staging/comfy/cms/file/files/000/000", "http://#{hostname}/images")
        else
          logger.error("IMAGE: Unknown #{img}")
        end
      #next if not img =~ /http/
      thumb = img.sub("original", "cms_thumb")
      image_str.sub!("#{original_image}", "<li class=\"mTSThumbContainer\"><a rel=\"group1\" class=\"single_image\" href=\"#{img}\"><img class=\"mTSThumb\" src=\"#{thumb}\"/></a></li>")
    end
    html = "#{html[0..(idx-1)]}#{image_str}#{html[endidx..-1]}"
  end
       
  # categories or tags
  tagstr = tags.join(" ")
  html.gsub!('$TAGS$', "#{tagstr}")
  pdate = cms_page.updated_at
  
  #  templates
  html.sub!('$UPDATED_AT$', find_publish_on_date(html, pdate))
  html.sub!('$TITLE$', cms_page.label)
  html.sub!('$ARTICLEID$', cms_page.id.to_s)
  
  # remove published_on
  html = remove_section(html, '<div class="publish_on">', '</div>')       

  return html
end