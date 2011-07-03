# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{comfortable_mexican_sofa}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oleg Khabarov", "The Working Group Inc"]
  s.date = %q{2011-07-03}
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
    "app/assets/images/comfortable_mexican_sofa/arrow_bottom.gif",
    "app/assets/images/comfortable_mexican_sofa/arrow_right.gif",
    "app/assets/images/comfortable_mexican_sofa/icon_layout.gif",
    "app/assets/images/comfortable_mexican_sofa/icon_move.gif",
    "app/assets/images/comfortable_mexican_sofa/icon_regular.gif",
    "app/assets/images/comfortable_mexican_sofa/icon_snippet.gif",
    "app/assets/images/comfortable_mexican_sofa/wym_icons.png",
    "app/assets/javascripts/comfortable_mexican_sofa/application.js",
    "app/assets/javascripts/comfortable_mexican_sofa/codemirror/codemirror.js",
    "app/assets/javascripts/comfortable_mexican_sofa/jquery.js",
    "app/assets/javascripts/comfortable_mexican_sofa/jquery_ui.js",
    "app/assets/javascripts/comfortable_mexican_sofa/plupload/plupload.html5.js",
    "app/assets/javascripts/comfortable_mexican_sofa/plupload/plupload.js",
    "app/assets/javascripts/comfortable_mexican_sofa/rails.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-blockquote.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-h1.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-h2.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-h3.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-h4.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-h5.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-h6.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-p.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/lbl-pre.png",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/wymiframe.css",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/iframe/default/wymiframe.html",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/jquery.wymeditor.cms.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/jquery.wymeditor.pack.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/bg.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/ca.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/cs.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/cy.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/de.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/en.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/es.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/fa.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/fi.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/fr.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/gl.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/he.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/hr.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/hu.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/it.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/nb.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/nl.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/nn.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/pl.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/pt-br.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/pt.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/ru.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/sv.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/tr.js",
    "app/assets/javascripts/comfortable_mexican_sofa/wymeditor/lang/zh_cn.js",
    "app/assets/stylesheets/comfortable_mexican_sofa/application.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/codemirror.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/content.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/form.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/reset.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/structure.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/typography.css",
    "app/assets/stylesheets/comfortable_mexican_sofa/widgets.css",
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
    "comfortable_mexican_sofa.gemspec",
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
    "config/locales/es.yml",
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
    "db/migrate/upgrades/04_upgrade_to_1_3_0.rb",
    "db/seeds.rb",
    "doc/page_editing.png",
    "doc/sofa.png",
    "lib/comfortable_mexican_sofa.rb",
    "lib/comfortable_mexican_sofa/acts_as_tree.rb",
    "lib/comfortable_mexican_sofa/configuration.rb",
    "lib/comfortable_mexican_sofa/controller_methods.rb",
    "lib/comfortable_mexican_sofa/engine.rb",
    "lib/comfortable_mexican_sofa/error.rb",
    "lib/comfortable_mexican_sofa/fixtures.rb",
    "lib/comfortable_mexican_sofa/form_builder.rb",
    "lib/comfortable_mexican_sofa/has_revisions.rb",
    "lib/comfortable_mexican_sofa/http_auth.rb",
    "lib/comfortable_mexican_sofa/is_mirrored.rb",
    "lib/comfortable_mexican_sofa/rails_extensions.rb",
    "lib/comfortable_mexican_sofa/tag.rb",
    "lib/comfortable_mexican_sofa/tags/asset.rb",
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
    "lib/comfortable_mexican_sofa/tags/upload.rb",
    "lib/comfortable_mexican_sofa/version.rb",
    "lib/comfortable_mexican_sofa/view_hooks.rb",
    "lib/comfortable_mexican_sofa/view_methods.rb",
    "lib/generators/README",
    "lib/generators/cms_generator.rb",
    "lib/tasks/comfortable_mexican_sofa.rake",
    "public/422.html",
    "public/500.html",
    "public/favicon.ico",
    "public/robots.txt",
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
    "test/functional/cms_admin/base_controller_test.rb",
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
    "test/unit/form_builder_test.rb",
    "test/unit/mirrors_test.rb",
    "test/unit/models/block_test.rb",
    "test/unit/models/layout_test.rb",
    "test/unit/models/page_test.rb",
    "test/unit/models/site_test.rb",
    "test/unit/models/snippet_test.rb",
    "test/unit/models/upload_test.rb",
    "test/unit/revisions_test.rb",
    "test/unit/tag_test.rb",
    "test/unit/tags/asset_test.rb",
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
    "test/unit/tags/upload_test.rb",
    "test/unit/view_methods_test.rb"
  ]
  s.homepage = %q{http://github.com/twg/comfortable-mexican-sofa}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{ComfortableMexicanSofa is a powerful micro CMS for Ruby on Rails 3 applications}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<active_link_to>, [">= 0.0.0"])
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.11"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<active_link_to>, [">= 0.0.0"])
      s.add_dependency(%q<paperclip>, [">= 2.3.11"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<active_link_to>, [">= 0.0.0"])
    s.add_dependency(%q<paperclip>, [">= 2.3.11"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

