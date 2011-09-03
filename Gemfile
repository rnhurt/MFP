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

group :development, :test do
  gem "ruby-debug19"
  gem "sqlite3-ruby", :require => "sqlite3"
  gem "thin"
  gem "hirb"
  gem "wirble"
  gem "awesome_print"
  gem "rspec-rails"
  gem "faker"
end

group :test do
  # Pretty printed test output
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