FactoryGirl.define do
  factory :goldbrick do
    name     Faker::Name.name
    link     Faker::Internet.url
    login    Faker::Internet.slug
    password 'secret'
    content  Faker::Lorem.words

    factory :facebook do
      name     'Facebook'
      link     'https://facebook.com'
      login    Faker::Internet.slug
      password 'secret'
      content  'Facebook account'
    end
    
    # create(:goldbrick_with_vault, subdomain: 'me')
    factory :goldbrick_with_vault do
      transient { subdomain nil }
      after(:build) do |goldbrick, evaluator|
        goldbrick.vault = build(:vault, subdomain: evaluator.subdomain)
      end
      after(:create) { |g,e| g.vault.save }
    end

  end
end
