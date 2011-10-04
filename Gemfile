source "http://rubygems.org"

gem "rails", "3.1.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem "haml-rails"
gem "sorcery"

group :development do
  gem "ruby-debug19"
  gem "rails-erd"
  gem "hirb"
  gem "wirble"
  gem "awesome_print"
end


group :development, :test do
  gem "sqlite3-ruby", :require => "sqlite3"
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "faker"
  gem "thin"
  gem "turn", :require => false
end


group :production do
  ### these gems are temporarily needed for Heroku app deployment
  gem 'therubyracer-heroku', '0.8.1.pre3'
  gem "faker"
  gem "thin"
  gem "pg"
  ### these gems are temporarily needed for Heroku app deployment

  # gem "dalli"   # memcached client
end