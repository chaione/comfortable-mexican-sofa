require File.expand_path('../test_helper', File.dirname(__FILE__))

class CmsConfigurationTest < ActiveSupport::TestCase
  
  def test_configuration_presense
    assert config = ComfortableMexicanSofa.configuration
    assert_equal 'ComfortableMexicanSofa', config.cms_title
    assert_equal 'ComfortableMexicanSofa::HttpAuth', config.authentication
    assert_equal nil, config.seed_data_path
    assert_equal 'cms-admin', config.admin_route_prefix
  end
  
  def test_initialization_overrides
    ComfortableMexicanSofa.configuration.cms_title = 'New Title'
    assert_equal 'New Title', ComfortableMexicanSofa.configuration.cms_title
  end
  
end