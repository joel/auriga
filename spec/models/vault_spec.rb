require 'rails_helper'

RSpec.describe Vault, type: :model do

  # response, operation = Vault::Create.run(attributes)
  let(:vault) do
    Vault::Create.run(attributes)
  end

  describe 'validation' do
    context 'with valid parameters' do
      let(:attributes) do
        { vault: attributes_for(:vault) }
      end
      specify do
        response, operation = vault
        expect(response).to be_truthy
        expect(operation.model).to be_persisted
      end
    end
    context 'with invalid parameters' do
      let(:attributes) do
        { vault: { subdomain: nil }}
      end
      specify do
        response, operation = vault
        expect(response).to be_falsey
        expect(operation.model).to_not be_persisted
        expect(operation.contract.errors.to_s).to eql("{:subdomain=>[\"can't be blank\"]}")
      end
    end
  end

end
