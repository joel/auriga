source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'slim-rails'
# gem 'simple_form'
# gem 'slim'
# gem 'cells'

# Trailblazer
# gem 'virtus'
# gem 'representable'
gem 'reform'
gem 'trailblazer'
gem 'cells', '4.0.0.beta2'
gem 'simple_form'
# gem 'haml-rails'

# gem 'cells-haml', git: 'https://github.com/trailblazer/cells-haml'



# gem 'slim-rails'
# gem 'simple_form'

# gem 'devise'
# gem 'devise_invitable'
# gem 'devise-i18n'
# gem 'devise-i18n-views' #, git: 'git@github.com:mcasimir/devise-i18n-views.git'
#
# gem 'rails-i18n'
# gem 'i18n-language-translations'
#
# # gem 'i18n_helper', path: '../../Gems/i18n_helper'
# gem 'i18n_helper', '>= 0.0.3'
#
# gem 'mandrill-api'

gem 'figaro'
# gem 'less-rails'
# gem 'rolify'
# gem 'sendgrid'

gem 'simple_form'

gem 'twitter-bootswatch-rails'
gem 'twitter-bootswatch-rails-fontawesome'
gem 'twitter-bootswatch-rails-helpers'

# Cause of this bug https://github.com/slim-template/slim/issues/609 need wait for less-rails version > 2.7.0
gem 'less-rails', git: 'https://github.com/metaskills/less-rails.git'

gem 'mongoid'

gem 'tenancy'

# gem 'timezone'
# gem 'i18n-timezones'

gem 'bower-rails' #, '~> 0.8.3'

group :development do
  gem 'quiet_assets'
  # gem 'rb-fchange', require: false
  # gem 'rb-fsevent', require: false
  # gem 'rb-inotify', require: false
  # gem 'spring'
end

group :production do
  # gem 'puma'
  # gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'coveralls', require: false

  gem 'rspec-rails'
  # gem 'rspec-cells'
end

group :test do
  gem 'capybara'
  # gem 'selenium-webdriver'
  # gem 'poltergeist'
  # gem 'database_cleaner'
  # gem 'email_spec'
  # gem 'timecop'
  # gem 'i18n-spec'
end
