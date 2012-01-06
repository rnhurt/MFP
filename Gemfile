source 'http://rubygems.org'

gem 'rails', '3.2.0.rc2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets'
  gem 'sass-rails'
# gem 'coffee-rails', '~> 3.2.0'
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

#  gem 'ruby-debug-base19x', '~> 0.11.30.pre5'
#  gem 'ruby-debug19', :require => 'ruby-debug'
  
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
  ### these gems are temporarily needed for Heroku app deployment
  gem 'pg'
  ### these gems are temporarily needed for Heroku app deployment
end
