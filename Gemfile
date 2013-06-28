source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'redis'
gem 'sinatra'
gem 'slim'

group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'thin'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "devise"
gem "figaro"
gem "cancan"

gem 'bootstrap-sass', '~> 2.3.1.2'

gem 'sidekiq'
gem 'sidekiq-status'
gem 'sidekiq-failures'

gem 'newrelic_rpm'
gem 'unicorn'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "quiet_assets"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "email_spec"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
