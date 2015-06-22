FactoryGirl.define do
  sequence :email do |n|
    # "test_#{n}_#{rand(10000 * n)}@example.com"
    Faker::Internet.email
  end
  sequence :subdomain do |n|
    "subdomain-#{n}-#{rand(10000 * n)}"
  end
end
