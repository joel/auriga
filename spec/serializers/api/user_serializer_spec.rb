require 'rails_helper'

describe Api::UserSerializer do
  let(:user) { create :user, name: 'Keenan Bogisich', email: 'jaiden_hauck@dietrich.com' }

  subject { JSON.load(described_class.new(user).to_json) }

  it "should have 'user' key" do
    expect(subject.fetch('user')).to_not      be_nil

    expect(subject['user'].fetch('name')).to     eq('Keenan Bogisich')
    expect(subject['user'].fetch('email')).to    eq('jaiden_hauck@dietrich.com')
    expect(subject['user'].fetch('security')).to eq('nothing')
    expect(subject['user'].fetch('roles')).to    eq('invited')
  end
end
