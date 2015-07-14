require 'acceptance_helper'

describe 'sign in', type: :feature do
  include MailerHelper

  let(:user) do |variable|
    create(:user_with_vault, :confirmed, subdomain: 'me').tap do |user|
      expect(user.vault).to be_present
      expect(user.vault.subdomain).to eql('me')
    end
  end

  it 'should redirect to show vault' do
    sign_in_as user, 'secret'
    expect(current_path).to eq("/goldbricks")
  end

end
