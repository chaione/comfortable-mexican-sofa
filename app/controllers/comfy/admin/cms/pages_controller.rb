class Comfy::Admin::Cms::PagesController < Comfy::Admin::Cms::BaseController

  before_action :check_for_layouts, :only => [:new, :edit]
  before_action :build_cms_page,    :only => [:new, :create]
  before_action :load_cms_page,     :only => [:edit, :update, :destroy]
  before_action :authorize
  before_action :preview_cms_page,  :only => [:create, :update]

  def index
    return redirect_to :action => :new if site_has_no_pages?

    return index_for_redactor if params[:source] == 'redactor'

    @pages_by_parent = pages_grouped_by_parent

    if params[:category].present?
      @pages = @site.pages.includes(:categories).for_category(params[:category]).order('label')
    else
      @pages = [@site.pages.root].compact
    end
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @page.save!
    flash[:success] = I18n.t('comfy.admin.cms.pages.created')
    redirect_to :action => :edit, :id => @page
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:danger] = "#{e}"
    #flash.now[:danger] = I18n.t('comfy.admin.cms.pages.creation_failure')
    render :action => :new
  end

  def update
    @page.save!
    flash[:success] = I18n.t('comfy.admin.cms.pages.updated')
    redirect_to :action => :edit, :id => @page
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = I18n.t('comfy.admin.cms.pages.update_failure')
    render :action => :edit
  end

  def destroy
    del = ::Comfy::Cms::Darticle.new
    del.article_id = @page.id
    del.save!
    @page.destroy
    flash[:success] = I18n.t('comfy.admin.cms.pages.deleted')
    redirect_to :action => :index
  end
  
  def form_blocks
    @page = @site.pages.find_by_id(params[:id]) || @site.pages.new
    @page.layout = @site.layouts.find_by_id(params[:layout_id])
  end

  def toggle_branch
    @pages_by_parent = pages_grouped_by_parent
    @page = @site.pages.find(params[:id])
    s   = (session[:cms_page_tree] ||= [])
    id  = @page.id.to_s
    s.member?(id) ? s.delete(id) : s << id
  rescue ActiveRecord::RecordNotFound
    # do nothing
  end

  def reorder
    (params[:comfy_cms_page] || []).each_with_index do |id, index|
      ::Comfy::Cms::Page.where(:id => id).update_all(:position => index)
    end
    render :nothing => true
  end

protected


def remove_section(html, first, last)
  idx = html.index(first)
  return html if idx.nil?
  endidx = html.index(last, idx) + last.size
  html = "#{html[0..(idx-1)]}#{html[endidx..(html.size)]}"
end
def render_page(cms_page)
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
    body.gsub!("\r\n\r\n", "<p />")
    body.gsub!("\r\n", '<br />')
    html = "#{html[0..(idx-1)]}#{body}#{html[endidx..(html.size)]}"
    
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
      imgs.each do |img|
        img.strip!
        #next if not img =~ /http/
        thumb = img.sub("original", "cms_thumb")
        html.sub!("#{img}", "<li class=\"mTSThumbContainer\"><a rel=\"group1\" class=\"single_image\" href=\"#{img}\"><img class=\"mTSThumb\" src=\"#{thumb}\"/></a></li>")
      end
      idx = html.index('nss_images')
      endidx = html.index("</ul>", idx)
      hval = html[idx..endidx]
      hval.gsub!(',', '')
      html = "#{html[0..(idx-1)]}#{hval}#{html[endidx..-1]}"
    end
    
    # remove published_on
    html = remove_section(html, '<div class="publish_on">', '</div>')
         
    # categories or tags
    tagstr = tags.join(" ")
    html.gsub!('$TAGS$', "#{tagstr}")
    pdate = cms_page.updated_at
    
    #  templates
    html.sub!('$UPDATED_AT$', pdate.strftime("%b-%-d-%Y"))
    html.sub!('$TITLE$', cms_page.label)
    html.sub!('$ARTICLEID$', cms_page.id.to_s)

    html
end

  def index_for_redactor
    tree_walker = ->(page, list, offset) do
      return unless page.present?
      label = "#{'. . ' * offset}#{page.label}"
      list << {:name => label, :url => page.url(:relative)}
      page.children.each do |child_page|
        tree_walker.(child_page, list, offset + 1)
      end
      list
    end

    page_select_options = [{
      :name => I18n.t('comfy.admin.cms.pages.form.choose_link'),
      :url  => false
    }] + tree_walker.(@site.pages.root, [ ], 0)

    render :json => page_select_options
  end

  def site_has_no_pages?
    @site.pages.count == 0
  end

  def pages_grouped_by_parent
    @site.pages.includes(:categories).group_by(&:parent_id)
  end

  def check_for_layouts
    if @site.layouts.count == 0
      flash[:danger] = I18n.t('comfy.admin.cms.pages.layout_not_found')
      redirect_to new_comfy_admin_cms_site_layout_path(@site)
    end
  end

  def build_cms_page
    @page = @site.pages.new(page_params)
    @page.parent ||= (@site.pages.find_by_id(params[:parent_id]) || @site.pages.root)
    @page.layout ||= (@page.parent && @page.parent.layout || @site.layouts.first)
  end

  def load_cms_page
    @page = @site.pages.find(params[:id])
    @page.attributes = page_params
    @page.layout ||= (@page.parent && @page.parent.layout || @site.layouts.first)
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = I18n.t('comfy.admin.cms.pages.not_found')
    redirect_to :action => :index
  end

  def preview_cms_page
    if params[:preview]
      layout = @page.layout.app_layout.blank?? false : @page.layout.app_layout
      @cms_site   = @page.site
      @cms_layout = @page.layout
      @cms_page   = @page
      html = render_page(@cms_page)

      # Chrome chokes on content with iframes. Issue #434
      response.headers['X-XSS-Protection'] = '0'

      render :inline => html, :layout => layout, :content_type => 'text/html'
    end
  end

  def page_params
    params.fetch(:page, {}).permit!
  end
end
