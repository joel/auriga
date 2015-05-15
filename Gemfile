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

gem 'slim-rails'

# Trailblazer stuffs
gem 'reform'
gem 'trailblazer'
gem 'cells', '4.0.0.beta2'
gem 'simple_form'

gem 'figaro'

# Boostrap
gem 'twitter-bootswatch-rails'
gem 'twitter-bootswatch-rails-fontawesome'
gem 'twitter-bootswatch-rails-helpers'

# Cause of this bug https://github.com/slim-template/slim/issues/609 need wait for less-rails version > 2.7.0
gem 'less-rails', git: 'https://github.com/metaskills/less-rails.git'
gem 'mongoid'

gem 'bower-rails'

group :production do
  gem 'puma'
  gem 'rails_12factor'
end

group :development do
  gem 'quiet_assets'
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
  gem 'onesky-rails'
end

group :test do
  gem 'capybara'
end
