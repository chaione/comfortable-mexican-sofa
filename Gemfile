source 'http://rubygems.org'

gem 'rails',          '>= 3.0.0'
gem 'active_link_to', '~> 1.0.0'

if Gem::Version.new(RUBY_VERSION.dup) < Gem::Version.new('1.9.2')
  gem 'paperclip', '>= 2.3.0', '< 3.0.0'
else
  gem 'paperclip', '>= 2.3.0'
end

group :test do
  gem 'sqlite3'
  gem 'jeweler'
end
