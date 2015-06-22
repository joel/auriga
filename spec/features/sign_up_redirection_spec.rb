require 'acceptance_helper'

describe 'sign up', type: :feature do
  include MailerHelper

  let(:email) { Faker::Internet.email }

  it 'should redirect to new vault' do
    visit new_user_registration_path
    within("#new_user") do
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: 'secret'
      fill_in 'user[password_confirmation]', with: 'secret'
    end
    click_button I18n.t('devise.registrations.new.sign_up') # Sign up
    expect(page).to have_content(I18n.t('devise.registrations.signed_up_but_unconfirmed')) # A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.
    expect(last_email.to).to have_content email
    expect(last_email.body).to have_content I18n.t('devise.mailer.confirmation_instructions.action') # Confirm my account
    link = last_email.body.raw_source.match(/href="(?<url>.+?)">/)[:url]
    visit link
    expect(page).to have_content I18n.t('devise.confirmations.confirmed') # Your email address has been successfully confirmed.
    within("#new_user") do
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: 'secret'
    end
    click_button I18n.t('devise.sessions.new.sign_in') # Sign in
    expect(current_path).to eq(new_vault_path)
  end

end
