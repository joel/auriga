module Features
  module HelperMethods

    def sign_up_and_confirm_as user, password='secret'
      sign_up_as user, password
      confirm_last_sign_up!
      sign_up_as user, password
    end

    def confirm_last_sign_up!
      token = extract_confirmation_token last_email
      visit "/users/confirmation?confirmation_token=#{token}"
    end

    def sign_up_as user, password='secret'
      visit new_user_registration_path

      within '#new_user' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: password
        click_button I18n.t('devise.registrations.new.sign_up') # Sign up
      end
    end

    def sign_in_as user, password='secret'
      visit new_user_session_path
      fill_login_as user, password
    end

    def fill_login_as user, password='secret'
      within("#new_user") do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: 'secret'
      end
      click_button I18n.t('devise.sessions.new.sign_in') # Sign in
    end

    def logout
      click_link I18n.t('devise.shared.sign_out') # Sign out
    end

    private

    def last_email
      ActionMailer::Base.deliveries.last
    end

    def extract_confirmation_token(email)
      email && email.body && email.body.to_s.match(/confirmation_token=(?<token>[^"]+)/)[:token]
    end
  end
end

RSpec.configuration.include Features::HelperMethods, type: :feature
