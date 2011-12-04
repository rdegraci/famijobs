source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem "therubyracer", :require => 'v8'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'




gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'devise'

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'sqlite3'
  gem 'webrat'	# necessary since capybara is not yet supported in view specs
  gem 'capybara'
  gem "rspec-rails", "~> 2.6"
  gem "factory_girl_rails"
  gem 'seed_dump'
  gem 'launchy'
end

group :test do
  gem 'cucumber-rails'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
