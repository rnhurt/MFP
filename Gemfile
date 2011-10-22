source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'sorcery'

group :development do
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
  ### these gems are temporarily needed for Heroku app deployment
  gem 'therubyracer'
  gem 'thin'
  gem 'pg'
  ### these gems are temporarily needed for Heroku app deployment
end
