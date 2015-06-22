require 'acceptance_helper'

describe 'sign in', type: :feature do
  include MailerHelper

  let(:user) { create(:user_with_vault, :confirmed, subdomain: 'me') }

  it 'should redirect to show vault' do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'secret'
    end
    click_button I18n.t('devise.sessions.new.sign_in') # Sign in
    expect(current_path).to eq("/users")
    # expect(current_path).to eq("http://me.example.com/users")
    # expect(current_path).to eq("http://#{user.vault.subdomain}.example.com#{users_url(subdomain: user.vault.subdomain)}")
  end

end
