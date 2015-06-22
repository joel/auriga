require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after(:each) do
    Mongoid::Multitenancy.current_tenant = nil
    DatabaseCleaner.clean
  end
end
