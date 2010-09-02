require  File.dirname(__FILE__) + '/../../test_helper'

class CmsAdmin::PagesControllerTest < ActionController::TestCase
  
  def test_get_index
    get :index
    assert_response :success
    assert assigns(:cms_pages)
    assert_template :index
  end
  
  def test_get_new
    get :new
    assert_response :success
    assert assigns(:cms_page)
    assert_template :new
    assert_select 'form[action=/cms-admin/pages]'
  end
  
  def test_get_new_as_child_page
    flunk
  end
  
  def test_get_edit
    page = cms_pages(:default)
    get :edit, :id => page
    assert_response :success
    assert assigns(:cms_page)
    assert_template :edit
    assert_select "form[action=/cms-admin/pages/#{page.id}]"
  end
  
  def test_get_edit_failure
    get :edit, :id => 'not_found'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Page not found', flash[:error]
  end
  
  def test_creation
    assert_difference 'CmsPage.count' do
      assert_difference 'CmsBlock.count', 3 do
        post :create, :cms_page => {
          :label          => 'Test Page',
          :slug           => 'test-page',
          :parent_id      => cms_pages(:default).id,
          :cms_layout_id  => cms_layouts(:default).id,
          :cms_blocks_attributes => [
            { :label    => 'content',
              :type     => 'CmsTag::PageText',
              :content  => 'content content' },
            { :label    => 'title',
              :type     => 'CmsTag::PageString',
              :content  => 'title content' },
            { :label    => 'number',
              :type     => 'CmsTag::PageInteger',
              :content  => '999' }
          ]
        }
        assert_response :redirect
        assert_redirected_to :action => :edit, :id => CmsPage.last
        assert_equal 'Page saved', flash[:notice]
      end
    end
  end
  
  def test_creation_failure
    assert_no_difference ['CmsPage.count', 'CmsBlock.count'] do
      post :create, :cms_page => {}
      assert_response :success
      assert assigns(:cms_page)
      assert_template :new
    end
  end
  
  def test_creation_with_faked_blocks
    flunk
  end
  
  def test_creation_persisting_blocks
    flunk
  end
  
  def test_update
    flunk
  end
  
  def test_update_failure
    flunk
  end
  
  def test_destroy
    flunk
  end
  
  def test_get_form_blocks
    xhr :get, :form_blocks, :id => cms_pages(:default), :layout_id => cms_layouts(:nested).id
    assert_response :success
    assert assigns(:cms_page)
    assert_equal 2, assigns(:cms_page).cms_blocks.size
    assert_template :form_blocks
    
    xhr :get, :form_blocks, :id => cms_pages(:default), :layout_id => cms_layouts(:default).id
    assert_response :success
    assert assigns(:cms_page)
    assert_equal 3, assigns(:cms_page).cms_blocks.size
    assert_template form_blocks
  end
  
  def test_get_form_blocks_for_new_page
    xhr :get, :form_blocks, :id => 0, :layout_id => cms_layouts(:default).id
    assert_response :success
    assert assigns(:cms_page)
    assert_equal 3, assigns(:cms_page).cms_blocks.size
    assert_template :form_blocks
  end
  
end