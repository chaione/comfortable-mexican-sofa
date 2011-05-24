# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{comfortable_mexican_sofa}
  s.version = "1.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oleg Khabarov", "The Working Group Inc"]
  s.date = %q{2011-05-24}
  s.description = %q{}
  s.email = %q{oleg@theworkinggroup.ca}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".gemtest",
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/controllers/application_controller.rb",
    "app/controllers/cms_admin/base_controller.rb",
    "app/controllers/cms_admin/layouts_controller.rb",
    "app/controllers/cms_admin/pages_controller.rb",
    "app/controllers/cms_admin/revisions_controller.rb",
    "app/controllers/cms_admin/sites_controller.rb",
    "app/controllers/cms_admin/snippets_controller.rb",
    "app/controllers/cms_admin/uploads_controller.rb",
    "app/controllers/cms_content_controller.rb",
    "app/models/cms/block.rb",
    "app/models/cms/layout.rb",
    "app/models/cms/page.rb",
    "app/models/cms/revision.rb",
    "app/models/cms/site.rb",
    "app/models/cms/snippet.rb",
    "app/models/cms/upload.rb",
    "app/views/cms_admin/layouts/_form.html.erb",
    "app/views/cms_admin/layouts/_index_branch.html.erb",
    "app/views/cms_admin/layouts/edit.html.erb",
    "app/views/cms_admin/layouts/index.html.erb",
    "app/views/cms_admin/layouts/new.html.erb",
    "app/views/cms_admin/pages/_form.html.erb",
    "app/views/cms_admin/pages/_form_blocks.html.erb",
    "app/views/cms_admin/pages/_index_branch.html.erb",
    "app/views/cms_admin/pages/edit.html.erb",
    "app/views/cms_admin/pages/form_blocks.js.erb",
    "app/views/cms_admin/pages/index.html.erb",
    "app/views/cms_admin/pages/new.html.erb",
    "app/views/cms_admin/pages/toggle_branch.js.erb",
    "app/views/cms_admin/revisions/show.html.erb",
    "app/views/cms_admin/sites/_form.html.erb",
    "app/views/cms_admin/sites/_mirrors.html.erb",
    "app/views/cms_admin/sites/edit.html.erb",
    "app/views/cms_admin/sites/index.html.erb",
    "app/views/cms_admin/sites/new.html.erb",
    "app/views/cms_admin/snippets/_form.html.erb",
    "app/views/cms_admin/snippets/edit.html.erb",
    "app/views/cms_admin/snippets/index.html.erb",
    "app/views/cms_admin/snippets/new.html.erb",
    "app/views/cms_admin/uploads/_file.html.erb",
    "app/views/cms_admin/uploads/_index.html.erb",
    "app/views/cms_admin/uploads/destroy.js.erb",
    "app/views/layouts/cms_admin.html.erb",
    "app/views/layouts/cms_admin/_body.html.erb",
    "app/views/layouts/cms_admin/_center.html.erb",
    "app/views/layouts/cms_admin/_head.html.erb",
    "app/views/layouts/cms_admin/_left.html.erb",
    "app/views/layouts/cms_admin/_right.html.erb",
    "config.ru",
    "config/application.rb",
    "config/boot.rb",
    "config/database.yml",
    "config/environment.rb",
    "config/environments/development.rb",
    "config/environments/production.rb",
    "config/environments/test.rb",
    "config/initializers/comfortable_mexican_sofa.rb",
    "config/initializers/paperclip.rb",
    "config/locales/en.yml",
    "config/routes.rb",
    "db/cms_fixtures/example.com/layouts/default/_default.yml",
    "db/cms_fixtures/example.com/layouts/default/content.html",
    "db/cms_fixtures/example.com/layouts/default/css.css",
    "db/cms_fixtures/example.com/layouts/default/js.js",
    "db/cms_fixtures/example.com/layouts/default/nested/_nested.yml",
    "db/cms_fixtures/example.com/layouts/default/nested/content.html",
    "db/cms_fixtures/example.com/layouts/default/nested/css.css",
    "db/cms_fixtures/example.com/layouts/default/nested/js.js",
    "db/cms_fixtures/example.com/pages/index/_index.yml",
    "db/cms_fixtures/example.com/pages/index/child/_child.yml",
    "db/cms_fixtures/example.com/pages/index/child/left.html",
    "db/cms_fixtures/example.com/pages/index/child/right.html",
    "db/cms_fixtures/example.com/pages/index/content.html",
    "db/cms_fixtures/example.com/snippets/default/_default.yml",
    "db/cms_fixtures/example.com/snippets/default/content.html",
    "db/migrate/01_create_cms.rb",
    "db/migrate/upgrades/02_upgrade_to_1_1_0.rb",
    "db/migrate/upgrades/03_upgrade_to_1_2_0.rb",
    "db/seeds.rb",
    "doc/page_editing.png",
    "doc/sofa.png",
    "lib/comfortable_mexican_sofa.rb",
    "lib/comfortable_mexican_sofa/acts_as_tree.rb",
    "lib/comfortable_mexican_sofa/configuration.rb",
    "lib/comfortable_mexican_sofa/controller_methods.rb",
    "lib/comfortable_mexican_sofa/engine.rb",
    "lib/comfortable_mexican_sofa/fixtures.rb",
    "lib/comfortable_mexican_sofa/form_builder.rb",
    "lib/comfortable_mexican_sofa/has_revisions.rb",
    "lib/comfortable_mexican_sofa/http_auth.rb",
    "lib/comfortable_mexican_sofa/is_mirrored.rb",
    "lib/comfortable_mexican_sofa/rails_extensions.rb",
    "lib/comfortable_mexican_sofa/tag.rb",
    "lib/comfortable_mexican_sofa/tags/field_datetime.rb",
    "lib/comfortable_mexican_sofa/tags/field_integer.rb",
    "lib/comfortable_mexican_sofa/tags/field_string.rb",
    "lib/comfortable_mexican_sofa/tags/field_text.rb",
    "lib/comfortable_mexican_sofa/tags/helper.rb",
    "lib/comfortable_mexican_sofa/tags/page_datetime.rb",
    "lib/comfortable_mexican_sofa/tags/page_integer.rb",
    "lib/comfortable_mexican_sofa/tags/page_rich_text.rb",
    "lib/comfortable_mexican_sofa/tags/page_string.rb",
    "lib/comfortable_mexican_sofa/tags/page_text.rb",
    "lib/comfortable_mexican_sofa/tags/partial.rb",
    "lib/comfortable_mexican_sofa/tags/snippet.rb",
    "lib/comfortable_mexican_sofa/version.rb",
    "lib/comfortable_mexican_sofa/view_hooks.rb",
    "lib/comfortable_mexican_sofa/view_methods.rb",
    "lib/generators/README",
    "lib/generators/cms_generator.rb",
    "lib/tasks/comfortable_mexican_sofa.rake",
    "public/404.html",
    "public/422.html",
    "public/500.html",
    "public/favicon.ico",
    "public/images/comfortable_mexican_sofa/arrow_bottom.gif",
    "public/images/comfortable_mexican_sofa/arrow_right.gif",
    "public/images/comfortable_mexican_sofa/icon_layout.gif",
    "public/images/comfortable_mexican_sofa/icon_move.gif",
    "public/images/comfortable_mexican_sofa/icon_regular.gif",
    "public/images/comfortable_mexican_sofa/icon_snippet.gif",
    "public/javascripts/comfortable_mexican_sofa/cms.js",
    "public/javascripts/comfortable_mexican_sofa/codemirror/codemirror.css",
    "public/javascripts/comfortable_mexican_sofa/codemirror/codemirror.js",
    "public/javascripts/comfortable_mexican_sofa/codemirror/codemirror_base.js",
    "public/javascripts/comfortable_mexican_sofa/codemirror/parse_css.js",
    "public/javascripts/comfortable_mexican_sofa/codemirror/parse_html_mixed.js",
    "public/javascripts/comfortable_mexican_sofa/codemirror/parse_js.js",
    "public/javascripts/comfortable_mexican_sofa/codemirror/parse_xml.js",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_flat_0_aaaaaa_40x100.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_flat_75_ffffff_40x100.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_glass_55_fbf9ee_1x400.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_glass_65_ffffff_1x400.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_glass_75_dadada_1x400.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_glass_75_e6e6e6_1x400.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_glass_95_fef1ec_1x400.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-bg_highlight-soft_75_cccccc_1x100.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-icons_222222_256x240.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-icons_2e83ff_256x240.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-icons_454545_256x240.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-icons_888888_256x240.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/images/ui-icons_cd0a0a_256x240.png",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/jquery-ui.css",
    "public/javascripts/comfortable_mexican_sofa/jquery-ui/jquery-ui.js",
    "public/javascripts/comfortable_mexican_sofa/jquery.js",
    "public/javascripts/comfortable_mexican_sofa/plupload/plupload.full.min.js",
    "public/javascripts/comfortable_mexican_sofa/plupload/plupload.html5.min.js",
    "public/javascripts/comfortable_mexican_sofa/plupload/plupload.min.js",
    "public/javascripts/comfortable_mexican_sofa/rails.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/jquery.tinymce.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/langs/en.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/about.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/anchor.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/charmap.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/color_picker.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/editor_template.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/image.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/img/colorpicker.jpg",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/img/icons.gif",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/about.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/anchor.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/charmap.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/color_picker.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/image.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/link.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/js/source_editor.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/langs/en.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/langs/en_dlg.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/link.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/content.css",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/dialog.css",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/img/buttons.png",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/img/items.gif",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/img/menu_arrow.gif",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/img/menu_check.gif",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/img/progress.gif",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/img/tabs.gif",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/skins/default/ui.css",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/themes/advanced/source_editor.htm",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/tiny_mce.js",
    "public/javascripts/comfortable_mexican_sofa/tiny_mce/tiny_mce_popup.js",
    "public/robots.txt",
    "public/stylesheets/comfortable_mexican_sofa/content.css",
    "public/stylesheets/comfortable_mexican_sofa/form.css",
    "public/stylesheets/comfortable_mexican_sofa/reset.css",
    "public/stylesheets/comfortable_mexican_sofa/structure.css",
    "public/stylesheets/comfortable_mexican_sofa/typography.css",
    "script/rails",
    "test/fixtures/cms/blocks.yml",
    "test/fixtures/cms/layouts.yml",
    "test/fixtures/cms/pages.yml",
    "test/fixtures/cms/revisions.yml",
    "test/fixtures/cms/sites.yml",
    "test/fixtures/cms/snippets.yml",
    "test/fixtures/cms/uploads.yml",
    "test/fixtures/files/invalid_file.gif",
    "test/fixtures/files/valid_image.jpg",
    "test/fixtures/views/_nav_hook.html.erb",
    "test/fixtures/views/_nav_hook_2.html.erb",
    "test/functional/cms_admin/layouts_controller_test.rb",
    "test/functional/cms_admin/pages_controller_test.rb",
    "test/functional/cms_admin/revisions_controller_test.rb",
    "test/functional/cms_admin/sites_controller_test.rb",
    "test/functional/cms_admin/snippets_controller_test.rb",
    "test/functional/cms_admin/uploads_controller_test.rb",
    "test/functional/cms_content_controller_test.rb",
    "test/integration/authentication_test.rb",
    "test/integration/fixtures_test.rb",
    "test/integration/mirrors_test.rb",
    "test/integration/render_cms_test.rb",
    "test/integration/routing_extensions_test.rb",
    "test/integration/sites_test.rb",
    "test/integration/view_hooks_test.rb",
    "test/test_helper.rb",
    "test/unit/configuration_test.rb",
    "test/unit/fixtures_test.rb",
    "test/unit/mirrors_test.rb",
    "test/unit/models/block_test.rb",
    "test/unit/models/layout_test.rb",
    "test/unit/models/page_test.rb",
    "test/unit/models/site_test.rb",
    "test/unit/models/snippet_test.rb",
    "test/unit/models/upload_test.rb",
    "test/unit/revisions_test.rb",
    "test/unit/tag_test.rb",
    "test/unit/tags/field_datetime_test.rb",
    "test/unit/tags/field_integer_test.rb",
    "test/unit/tags/field_string_test.rb",
    "test/unit/tags/field_text_test.rb",
    "test/unit/tags/helper_test.rb",
    "test/unit/tags/page_datetime_test.rb",
    "test/unit/tags/page_integer_test.rb",
    "test/unit/tags/page_rich_text.rb",
    "test/unit/tags/page_string_test.rb",
    "test/unit/tags/page_text_test.rb",
    "test/unit/tags/partial_test.rb",
    "test/unit/tags/snippet_test.rb",
    "test/unit/view_methods_test.rb"
  ]
  s.homepage = %q{http://github.com/twg/comfortable-mexican-sofa}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{ComfortableMexicanSofa is a powerful micro CMS for Ruby on Rails 3 applications}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<active_link_to>, [">= 0.0.7"])
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.8"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<active_link_to>, [">= 0.0.7"])
      s.add_dependency(%q<paperclip>, [">= 2.3.8"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<active_link_to>, [">= 0.0.7"])
    s.add_dependency(%q<paperclip>, [">= 2.3.8"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

