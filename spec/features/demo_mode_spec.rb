require 'acceptance_helper'

describe 'demo workflow', type: :feature do
  include_context 'demo'

  it 'should authenticate demo user and access to his passwords' do
    visit demo_url(subdomain: 'demo')
    expect(current_url).to eq('http://demo.auriga.dev/goldbricks')
  end
end
