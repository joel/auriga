require 'acceptance_helper'

describe 'sign up and subdomain creattion', type: :feature do
  let(:user) { create(:user) }

  it '...' do
    sign_up_and_confirm_as user, 'secret'
    expect(current_path).to eq(new_vault_path)

    within '#new_vault' do
      fill_in 'vault[subdomain]', with: 'me'
      click_button I18n.t('simple_form.helpers.submit.vault.create') # Add your subdomain
    end

    expect(user.reload).to be_vault

    # save_and_open_page
    # expect(current_path).to eq(vault_url(id: user.vault, subdomain: user.vault.subdomain))
    expect(current_path).to eq(vault_path(user.vault))
  end

end
