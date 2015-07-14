FactoryGirl.define do
  sequence :email do |n|
    Faker::Internet.email
  end
  sequence :subdomain do |n|
    "subdomain-#{n}-#{rand(10000 * n)}"
  end
end
