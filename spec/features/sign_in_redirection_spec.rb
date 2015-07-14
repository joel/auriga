require 'acceptance_helper'

describe 'sign in', type: :feature do
  include MailerHelper

  context 'with subdomain' do
    let(:user) do |variable|
      create(:user_with_vault, :confirmed, subdomain: 'me').tap do |user|
        expect(user.vault).to be_present
        expect(user.vault.subdomain).to eql('me')
      end
    end

    it 'should be redirect to his entries' do
      sign_in_as user, 'secret'
      expect(current_path).to eq('/goldbricks')
    end
  end

  context 'without subdomain' do
    let(:user) do
      create(:user, :confirmed).tap do |user|
        expect(user.vault).to_not be_present
      end
    end

    it 'should be redirect for create his subdomain' do
      sign_in_as user, 'secret'
      expect(current_path).to eq(new_vault_path)
      # TODO try to go another page to verify this can be happen.
    end
  end
end
