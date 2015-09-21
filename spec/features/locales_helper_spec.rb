require 'acceptance_helper'

# TODO Don't forget to teardown in English
feature 'change theme', type: :feature, skip: true do
  scenario 'regular way' do
    visit root_path
    expect(page).to have_content('Language : English')
    click_link(I18n.t("languages.es").capitalize)
    # TODO Fill the rest...
  end
end
