require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 30)
end

# Capybara.current_driver = :poltergeist
Capybara.default_wait_time = 5
