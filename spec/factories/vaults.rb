# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vault do
    # transient do
    #   subdomain_name nil
    # end
    # subdomain { subdomain_name || generate(:subdomain) }
    subdomain { generate(:subdomain) }
  end
end
