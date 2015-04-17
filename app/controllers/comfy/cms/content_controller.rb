class Comfy::Cms::ContentController < Comfy::Cms::BaseController

  # Authentication module must have `authenticate` method
  include ComfortableMexicanSofa.config.public_auth.to_s.constantize

  before_action :load_fixtures
  before_action :load_cms_page,
                :authenticate,
                :only => :show

  rescue_from ActiveRecord::RecordNotFound, :with => :page_not_found

  def show
    if @cms_page.target_page.present?
      redirect_to @cms_page.target_page.url(:relative)
    else
      respond_to do |format|
        format.html { render_page }
        format.json { render :json => @cms_page }
      end
    end
  end

  def render_sitemap
    render
  end

protected

  def remove_section(html, first, last)
    idx = html.index(first)
    return html if idx.nil?
    endidx = html.index(last, idx) + last.size
    html = "#{html[0..(idx-1)]}#{html[endidx..(html.size)]}"
  end

  def render_page(status = 200)
    if @cms_layout = @cms_page.layout
      app_layout = (@cms_layout.app_layout.blank? || request.xhr?) ? false : @cms_layout.app_layout
      
      # categories to tabs
      tags_before = @cms_page.categories.map(&:label)
      tags = []
      tags_before.each do |tag|
        tags << tag if not tag =~ /location/
      end
      
      # html
      html = @cms_page.content_cache
      
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
      body.gsub!("\r\n\r\n", "<p />")
      body.gsub!("\r\n", '<br />')
      html = "#{html[0..(idx-1)]}#{body}#{html[endidx..(html.size)]}"
      
      # images
      idx = html.index('nss_images')
      idx = html.index(">", idx)
      endidx = html.index('<', idx)
      image_str = html[(idx+1)..(endidx-1)]
      image_str.strip!
      image_str.gsub!(',', ' ')
      imgs = image_str.split(' ')
      if imgs.size == 0
        html = remove_section(html, '<section id="thumb-gallery"', '</section>')
      else
        imgs.each do |img|
          img.strip!
          #next if not img =~ /http/
          thumb = img.sub("original", "cms_thumb")
          html.sub!("#{img}", "<li class=\"mTSThumbContainer\"><a rel=\"group1\" class=\"single_image\" href=\"#{img}\"><img class=\"mTSThumb\" src=\"#{thumb}\"/></a></li>")
        end
        idx = html.index('nss_images')
        endidx = html.index("</ul>", idx)
        html[idx..endidx].gsub!(',', '')
      end
      
      # remove published_on
      html = remove_section(html, '<div class="published_on">', '</div>')
           
      # categories or tags
      tagstr = tags.join(" ")
      html.gsub!('$TAGS$', "#{tagstr}")
      pdate = @cms_page.updated_at
      
      #  templates
      html.sub!('$UPDATED_AT$', pdate.strftime("%b-%-d-%Y"))
      html.sub!('$TITLE$', @cms_page.label)
      html.sub!('$ARTICLEID$', @cms_page.id.to_s)
  
      render  :inline       => html,
              :layout       => app_layout,
              :status       => status,
              :content_type => mime_type
    else
      render :text => I18n.t('comfy.cms.content.layout_not_found'), :status => 404
    end
  end

  # it's possible to control mimetype of a page by creating a `mime_type` field
  def mime_type
    mime_block = @cms_page.blocks.find_by_identifier(:mime_type)
    mime_block && mime_block.content || 'text/html'
  end

  def load_fixtures
    return unless ComfortableMexicanSofa.config.enable_fixtures
    ComfortableMexicanSofa::Fixture::Importer.new(@cms_site.identifier).import!
  end

  def load_cms_page
    @cms_page = @cms_site.pages.published.find_by_full_path!("/#{params[:cms_path]}")
  end

  def page_not_found
    @cms_page = @cms_site.pages.published.find_by_full_path!('/404')

    respond_to do |format|
      format.html { render_page(404) }
    end
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError.new("Page Not Found at: \"#{params[:cms_path]}\"")
  end
end
