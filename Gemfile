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

# Helpers
# gem 'i18n_helper', path: '../../Gems/i18n_helper'
gem 'i18n_helper', '>= 0.0.3'
gem 'rails-i18n'

# Views
gem 'slim-rails'

# Trailblazer stuffs
gem 'reform'
gem 'trailblazer'
gem 'cells', '4.0.0.beta2'
gem 'simple_form'

# Configuration
gem 'figaro'

# Boostrap
gem 'twitter-bootswatch-rails', '3.2.0.0'
gem 'twitter-bootswatch-rails-fontawesome', '4.0.3.0'
gem 'twitter-bootswatch-rails-helpers', '3.2.0.0'

# Cause of this bug https://github.com/slim-template/slim/issues/609 need wait for less-rails version > 2.7.0
gem 'less-rails', git: 'https://github.com/metaskills/less-rails.git'

# Backend storage
gem 'mongoid'

# Js dependencies
gem 'bower-rails'

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

group :development do
  gem 'quiet_assets'
  gem 'powder'
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
  gem 'onesky-rails', github: 'demental/onesky-rails', branch: 'working'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end
