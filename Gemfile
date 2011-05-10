source "http://rubygems.org"

gem "rails", "3.0.5"

gem "jquery-rails" 
gem "haml-rails"
gem "chronic"
# gem "devise"
# gem "omniauth"
# gem "carrierwave"       # provides file uploading
# gem "fog"               # provides connection to AWS S3
# gem "kaminari"          # provides pagination

group :development, :test do
  gem "ruby-debug19"
  gem "sqlite3-ruby", :require => "sqlite3"
  gem "hirb"
  gem "wirble"
  gem "awesome_print"
  gem "hpricot"
  gem "ruby_parser"
  gem "mongrel", "~> 1.2.0.pre2"
  gem "rspec-rails"
  gem "faker"
end

group :test do
  gem "shoulda-matchers"
  gem "factory_girl_rails"
  gem "autotest"
end

group :production do
  gem "faker"   # temporarily needed for Heroku 'demo' app deployment
 # gem "dalli"   # memcached client
 # gem "mysql"
end