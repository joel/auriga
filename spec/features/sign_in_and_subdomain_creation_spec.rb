require 'acceptance_helper'

describe 'sign up and subdomain creation', type: :feature do
  let(:user) { create(:user) }

  it '...' do
    sign_up_and_confirm_as user, 'secret'
    expect(current_path).to eq(new_vault_path)

    within '#new_vault' do
      fill_in 'vault[subdomain]', with: 'me'
      click_button I18n.t('simple_form.helpers.submit.vault.create') # Add your subdomain
    end

    expect(user.reload).to be_vault
    expect(current_url).to eql(goldbricks_url(subdomain: user.vault.subdomain))
  end

end
