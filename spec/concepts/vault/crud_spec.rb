require 'rails_helper'

describe Vault::Create do

  specify 'invalid' do
    response, operation = Vault::Create.run(vault: { subdomain: '' })
    expect(response).to be_falsey
    expect(operation.model).to_not be_persisted
    expect(operation.contract.errors.to_s).to eql("{:subdomain=>[\"can't be blank\"]}")
  end
end

describe Vault::Update do
  let(:vault) do
    _, op = Vault::Create.run(vault: { subdomain: 'me' })
    op.model
  end

  specify 'valid' do
    Vault::Update[
      id: vault.id,
      vault: { subdomain: 'foo' },
    ]
    expect(vault.reload.subdomain).to eql('foo')
  end
end
