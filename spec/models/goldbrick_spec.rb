require 'rails_helper'

RSpec.describe Goldbrick, type: :model do
  let(:tenant)    { create :vault }
  let(:goldbrick) { described_class.new(attributes_for(:goldbrick)) }

  before { assign_to_goldbrick(tenant, goldbrick) }

  specify do
    expect(goldbrick).to be_valid
  end
end
