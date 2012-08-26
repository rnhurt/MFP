source 'http://rubygems.org'

gem 'rails', '~> 3.2.2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.0.1'
  gem 'uglifier'
end

gem 'thin'
gem 'jquery-rails'
gem 'haml-rails'
gem 'sorcery'


group :development do
  gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
  gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  gem 'ruby-debug19'

  gem 'hirb'
  gem 'wirble'
  gem 'awesome_print'
  gem 'railroady'   # Documentation generator
end


group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'thin'

  # Pretty printed test output
  gem 'turn', :require => false
end


group :production do
  gem 'pg'
end
