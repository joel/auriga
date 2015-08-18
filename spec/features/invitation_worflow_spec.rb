require 'acceptance_helper'

describe 'invitation workflow', type: :feature do
  let(:user) do
    create(:user_with_vault, :confirmed, subdomain: 'me').tap do |user|
      expect(user.vault).to be_present
      expect(user.vault.subdomain).to eql('me')
    end
  end

  it 'and guest should be redirect under the subdomain of inviter' do
    sign_in_as user, 'secret'
    expect(current_url).to eq('http://me.auriga.dev/goldbricks')

    visit new_user_invitation_path
    expect(current_path).to eq(new_user_invitation_path)
    within '#new_user' do
      fill_in 'user[email]', with: 'fake@example.com'
      click_button I18n.t('devise.invitations.new.submit_button') # Send an invitation
    end
    # An invitation email has been sent to fake@example.com.
    expect(page).to have_content(I18n.t('devise.invitations.send_instructions', email: 'fake@example.com'))

    logout

    # Confirm invitation
    confirm_last_invitation!

    # Fill password
    within '#edit_user' do
      fill_in 'user[password]', with: 'secret'
      fill_in 'user[password_confirmation]', with: 'secret'
      click_button I18n.t('devise.invitations.edit.submit_button') # Set my password
    end

    # Your password was set successfully. You are now signed in.
    expect(page).to have_content I18n.t('devise.invitations.updated')

    # redirected to the subdomain of inviter
    expect(current_url).to eq('http://me.auriga.dev/goldbricks')
  end

end
