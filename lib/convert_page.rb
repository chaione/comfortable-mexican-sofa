
require 'socket'

def remove_section(html, first, last)
  idx = html.index(first)
  return html if idx.nil?
  endidx = html.index(last, idx) + last.size
  html = "#{html[0..(idx-1)]}#{html[endidx..(html.size)]}"
end

def find_publish(str)
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
  if ret.blank?
    return nil
  end
  return str
end

def mylog(str)
#  fd = open("/home/jwright/cms.log", "a")
#  fd.puts str
#  fd.close
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
  mylog("--------------------------------------------------")
  mylog(image_str)
  imgs = image_str.split(' ')
  newstr = ""
  if imgs.size == 0
    mylog("imgs.size == 0")
    html = remove_section(html, '<section id="thumb-gallery"', '</section>')
  else
    hostname = "newsstand.nblenergy.com"
    #hostname = "localhost:3000"
    #hostname = "news-stand-staging.herokuapp.com"
    imgs.each do |img|
      img.strip!
      mylog("original image #{img}")
        if img =~ /\A\/?images/
          img = "http://#{hostname}#{img}"
        elsif img =~ /amazonaws/
          mylog("amazon aws image")
          img.sub!("http://s3.amazonaws.com/noble-news-stand-staging/comfy/cms/files/files/000/000", "http://#{hostname}/images")
          mylog("img #{img}")
        else
          mylog("unknown image type #{img}")
        end
      #next if not img =~ /http/
      thumb = img.sub("original", "cms_thumb")
      newstr << "<li class=\"mTSThumbContainer\"><a rel=\"group1\" class=\"single_image\" href=\"#{img}\"><img class=\"mTSThumb\" src=\"#{thumb}\"/></a></li>"
      newstr << " "
    end
    mylog(newstr)
    html = "#{html[0..(idx)]}#{newstr}#{html[endidx..-1]}"
  end

  # links
  idx = html.index("class=\"links\"")
  endoflinks = html.index("</ul>", idx)
  idx = html.index("href=", idx)
  while true
    break if idx.nil? or idx > endoflinks
    idx += 6
    endidx = html.index('"', idx)
    link = html[idx..(endidx-1)].downcase
    if link =~ /\Ahttp/
    elsif link =~ /\Amailto/
    elsif link =~ /\Aibmspc/
    elsif link.size == 0 or link.blank?
    else
      mylog("link #{link}")
      link = "http://#{link}"
      before = html[0..(idx-1)]
      after = html[(endidx)..-1]
      html = "#{before}#{link}#{after}"
      idx += link.size
    end
    idx = html.index("href=", idx)
  end

  # categories or tags
  tagstr = tags.join(" ")
  html.gsub!('$TAGS$', "#{tagstr}")
  pdate = cms_page.created_at
  str = find_publish(html)
  str = cms_page.created_at.strftime("%y-%-m-%-d")  if str.nil?
  #  templates
  html.sub!('$UPDATED_AT$', str)
  html.sub!('$TITLE$', cms_page.label)
  html.sub!('$ARTICLEID$', cms_page.id.to_s)

  # remove published_on
  html = remove_section(html, '<div class="publish_on">', '</div>')
  return html
end
