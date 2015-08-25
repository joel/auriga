require 'acceptance_helper'

describe 'goldbrick workflow', type: :feature do
  include_context 'signed user'

  it 'should have a valid worklow for add and remove' do
    expect(current_url).to eq('http://me.auriga.dev/goldbricks')
    expect(page).to have_content('secret')

    click_link "goldbrick_delete_#{goldbrick.id}"
    expect(page).to_not have_content('secret')

    within '#new_goldbrick' do
      fill_in 'goldbrick[name]',     with: 'Fake'
      fill_in 'goldbrick[link]',     with: 'http://example.com'
      fill_in 'goldbrick[login]',    with: 'fake@example.com'
      fill_in 'goldbrick[password]', with: 'secret'
      fill_in 'goldbrick[content]',  with: 'Fake Content'
      click_button I18n.t('helpers.submit.goldbrick.create') # Add new access
    end
    expect(page).to have_content('Fake')
  end
end
