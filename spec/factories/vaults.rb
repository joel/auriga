# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vault do
    # transient do
    #   subdomain_name nil
    # end
    # subdomain { subdomain_name || generate(:subdomain) }
    subdomain { generate(:subdomain) }

    # create(:with_goldbricks, goldbrick_count: 1)
    # create(:with_goldbricks)
    trait :with_goldbricks do
      transient { goldbrick_count 1 }
      after(:build) do |vault, evaluator|
        evaluator.goldbrick_count.times.each do
          vault.goldbricks << build(:goldbrick)
        end
      end
      after(:create) do |vault, evaluator|
        vault.save!
        vault.goldbricks.each(&:save!)
      end
    end

  end
end
