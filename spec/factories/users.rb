# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    # association :vault, strategy: :build
    sequence(:name) { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { generate(:email) }
    password 'secret'
    password_confirmation 'secret'

    trait :confirmed do
      confirmation_token nil
      confirmed_at 1.days.ago
      confirmation_sent_at 2.days.ago
    end

    # https://goo.gl/ahtqFZ
    trait :unconfirmed do
      confirmation_token do
        _, enc = Devise.token_generator.generate(User, :confirmation_token)
        enc
      end
      confirmed_at nil
      confirmation_sent_at nil
    end

    # create(:user_with_vault, :confirmed, subdomain: 'me')
    # create(:user_with_vault, subdomain: 'me')
    factory :user_with_vault do
      transient { subdomain nil }
      after(:build) do |user, evaluator|
        user.vault = build(:vault, subdomain: evaluator.subdomain)
      end
      after(:create) { |u,e| u.vault.save }
    end

    # create(:user, :with_vault_and_goldbricks, :confirmed, subdomain: 'me')
    # create(:user, :with_vault_and_goldbricks, subdomain: 'me')
    trait :with_vault_and_goldbricks do
      transient { subdomain FactoryGirl.generate(:subdomain) }
      after(:build) do |user, evaluator|
        user.vault = build(:vault, :with_goldbricks, subdomain: evaluator.subdomain)
      end
      after(:create) do |user, evaluator|
        user.save!
        user.vault.save!
        user.vault.goldbricks.each(&:save!)
      end

    end

  end
end
