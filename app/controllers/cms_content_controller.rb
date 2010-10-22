class CmsContentController < ApplicationController
  
  before_filter :load_cms_site
  before_filter :load_cms_page,   :only => :render_html
  before_filter :load_cms_layout, :only => [:render_css, :render_js]
    
  def render_html(status = 200)
    layout = @cms_page.cms_layout.app_layout.blank?? false : @cms_page.cms_layout.app_layout
    render :inline => @cms_page.content, :layout => layout, :status => status
  end
  
  def render_css
    render :text => @cms_layout.merged_css, :content_type => 'text/css'
  end
  
  def render_js
    render :text => @cms_layout.merged_js, :content_type => 'text/javascript'
  end

protected
  
  def load_cms_site
    @cms_site = CmsSite.find_by_hostname!(request.host.downcase)
  rescue ActiveRecord::RecordNotFound
    render :text => 'Site Not Found', :status => 404
  end
  
  def load_cms_page
    # Attempting to load seed page
    if ComfortableMexicanSofa.configuration.seed_data_path
      @cms_page = CmsPage.load_from_file(@cms_site, "/#{params[:cms_path]}")
    end
    
    @cms_page ||= @cms_site.cms_pages.find_by_full_path!("/#{params[:cms_path]}")
    return redirect_to(@cms_page.target_page.full_path) if @cms_page.target_page
  rescue ActiveRecord::RecordNotFound
    if @cms_page = @cms_site.cms_pages.find_by_full_path('/404')
      render_html(404)
    else
      render :text => 'Page Not Found', :status => 404
    end
  end
  
  def load_cms_layout
    @cms_layout = @cms_site.cms_layouts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :nothing => true, :status => 404
  end
  
end
