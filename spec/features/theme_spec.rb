require 'acceptance_helper'

feature 'change theme', type: :feature do
  scenario 'regular way' do
    visit root_path
    # save_and_open_page
    expect(page).to have_content('flatly')
    click_link(I18n.t('helpers.links.theme', theme: 'flatly'))
    click_link('Readable')
    # save_and_open_page
    expect(page).to have_content('readable')
  end
end
