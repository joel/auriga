require 'acceptance_helper'

feature 'create vault', :type => :feature do
  scenario 'regular way' do
    visit new_vault_path
    within('#new_vault') do
      fill_in 'Subdomain', :with => 'bar'
    end
    click_button 'Create Vault'
    expect(page).to have_content 'bar'
  end
end

feature 'update vault', :type => :feature do
  given(:vault) { Vault.create!({ subdomain: 'foo' }) }
  
  scenario 'regular way' do
    visit edit_vault_path(vault)
    within("#edit_vault_#{vault.id}") do
      fill_in 'Subdomain', :with => 'bar'
    end
    click_button 'Update Vault'
    expect(page).to have_content 'bar'
  end
end