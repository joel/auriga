require 'acceptance_helper'

feature 'create vault', type: :feature, skip: true do
  scenario 'regular way' do
    visit new_vault_path
    # save_and_open_page
    within('#new_vault') do
      fill_in 'vault_subdomain', with: 'bar'
    end
    click_button I18n.t('helpers.submit.vault.create')
    expect(page).to have_content 'bar'
  end
end

feature 'update vault', type: :feature, skip: true do
  given(:vault) { Vault.create!({ subdomain: 'foo' }) }

  scenario 'regular way' do
    visit edit_vault_path(vault)

    within("#edit_vault_#{vault.id}") do
      fill_in 'vault_subdomain', with: 'bar'
    end
    click_button I18n.t('helpers.submit.vault.update')
    expect(page).to have_content 'bar'
  end
end
