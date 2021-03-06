# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'comfortable_mexican_sofa/version'

Gem::Specification.new do |s|
  s.name          = "comfortable_mexican_sofa"
  s.version       = ComfortableMexicanSofa::VERSION
  s.authors       = ["Oleg Khabarov", "Jesse Wright"]
  s.email         = ["oleg@khabarov.ca", "jesse.wright.c1@chaione.com}"]
  s.homepage      = "http://github.com/jjwright55/comfortable-mexican-sofa"
  s.summary       = "Rails 4 CMS Engine"
  s.description   = "ComfortableMexicanSofa minor mod's for Chaione"
  s.license       = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'rails',             '>= 4.0.0', '< 5'
  s.add_dependency 'rails-i18n',        '>= 4.0.0'
  s.add_dependency 'bootstrap_form',    '>= 2.2.0'
  s.add_dependency 'active_link_to',    '>= 1.0.0'
  s.add_dependency 'paperclip',         '>= 4.0.0'
  s.add_dependency 'kramdown',          '>= 1.0.0'
  s.add_dependency 'jquery-rails',      '>= 3.0.0'
  s.add_dependency 'jquery-ui-rails',   '>= 5.0.0'
  s.add_dependency 'haml-rails',        '>= 0.3.0'
  s.add_dependency 'sass-rails',        '>= 4.0.3'
  s.add_dependency 'coffee-rails',      '>= 3.1.0'
  s.add_dependency 'codemirror-rails',  '>= 3.0.0'
  s.add_dependency 'bootstrap-sass',    '>= 3.2.0'
  s.add_dependency 'plupload-rails',    '>= 1.2.1'
  s.add_dependency 'videojs_rails',     '>= 4.6.1'
end
