require 'acceptance_helper'

feature 'change theme', type: :feature do
  scenario 'regular way' do
    visit root_path
    expect(page).to have_content('Language : English')
    click_link(I18n.t("languages.es").capitalize)
    # TODO Fill the rest...
  end
end
