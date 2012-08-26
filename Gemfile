source 'http://rubygems.org'

gem 'rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'uglifier'
end

gem 'thin'
gem 'jquery-rails'
gem 'haml-rails'
gem "bootstrap-sass", :git => 'git://github.com/dszczyt/bootstrap-sass.git'
gem 'sorcery'


group :development do
  # gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
  # gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  # gem 'ruby-debug19'
  gem 'debugger'

  gem 'hirb'
  gem 'wirble'
  gem 'awesome_print'
  gem 'railroady'   # Documentation generator
end


group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'thin'

  # Pretty printed test output
  gem 'turn', :require => false
end


group :production do
  gem 'pg'
end
