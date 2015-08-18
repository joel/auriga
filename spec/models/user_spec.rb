require 'rails_helper'

describe User do

  context '...' do
    let(:subdomain_one) { create(:vault) }
    let(:subdomain_two) { create(:vault) }

    before do
      Mongoid::Multitenancy.current_tenant = nil
      User.destroy_all
    end

    specify do
      # Create user attach to a subdomain
      Mongoid::Multitenancy.current_tenant = subdomain_one
      user1 = create(:user, name: 'New user 1')
      user1.vault = subdomain_one
      user1.save
      # We can see only this user
      expect(User.all.map(&:name)).to eql(['New user 1'])
      expect(User.authorized.all.map(&:name)).to eql(['New user 1'])

      # Create a user without subdomain / Classic way of devise sign up
      Mongoid::Multitenancy.current_tenant = nil
      user2 = create(:user, name: 'New user 2')
      # Unfortunalty mongoid-multitenancy show all users of the database instead nothing...
      # But on another hand this bring admin usage. but we can do without as well...
      expect(User.all.map(&:name)).to eql(['New user 1', 'New user 2'])
      # but if we scope only user without subdomain only this one is returned
      expect(User.authorized.all.map(&:name)).to eql(['New user 2'])

      # We switch to our previous and first subdomain
      Mongoid::Multitenancy.current_tenant = subdomain_one
      # Unfortunalty mongoid-multitenancy show all users of this subdomain + all users without subdomain this really suck...
      expect(User.all.map(&:name)).to eql(['New user 1', 'New user 2'])
      # But we can more restricted and show only users of our current subdomain
      expect(User.authorized.all.map(&:name)).to eql(['New user 1'])

      # Now we attach the new user to a new subdomain
      Mongoid::Multitenancy.current_tenant = subdomain_two
      user2.vault = subdomain_two
      user2.save
      # This time we have the expected result
      expect(User.all.map(&:name)).to eql(['New user 2'])
      expect(User.authorized.all.map(&:name)).to eql(['New user 2'])
    end
  end
end
