require 'acceptance_helper'

describe 'sign up', type: :feature do
  include MailerHelper

  let(:email) { Faker::Internet.email }
  let(:user) { double(:user, email: email) }
  
  it 'should redirect to new vault' do
    # Create account
    sign_up_as user, 'secret'

    # Try to visit => Sign in is required
    visit root_url
    expect(current_path).to eq(new_user_session_path)

    # Try to Sign in => Confirmation is required
    fill_login_as user, 'secret'
    expect(page).to have_content(I18n.t('devise.failure.unconfirmed')) # A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.

    # Confirm account
    confirm_last_sign_up!
    expect(page).to have_content I18n.t('devise.confirmations.confirmed') # Your email address has been successfully confirmed.

    # Sign in => New to create a subdomain
    fill_login_as user, 'secret'
    expect(current_path).to eq(new_vault_path)
  end

end
