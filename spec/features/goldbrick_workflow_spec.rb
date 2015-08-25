require 'acceptance_helper'

describe 'goldbrick workflow', type: :feature do
  include_context 'signed user'

  it '...' do
    expect(current_url).to eq('http://me.auriga.dev/goldbricks')
  end
end
