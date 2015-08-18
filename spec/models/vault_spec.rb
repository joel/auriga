require 'rails_helper'

RSpec.describe Vault, type: :model do
  let(:vault) { Vault.new(attributes[:vault]) }

  describe 'validation' do
    context 'with valid parameters' do
      let(:attributes) do
        { vault: attributes_for(:vault) }
      end
      specify do
        expect(vault).to be_valid
      end
    end
    context 'with invalid parameters' do
      let(:attributes) do
        { vault: { subdomain: nil }}
      end
      specify do
        expect(vault).to_not be_valid
        expect(vault.errors.full_messages).to eql(["Subdomain can't be blank"])
      end
    end
  end

end
