require 'rails_helper'

describe User::Create do
  # let(:user) { build(:user_with_vault, :confirmed, subdomain: 'me') }
  let(:attributes) do
    {
      name:                  'Tressie Klocko',
      email:                 'jaime@nolan.name',
      password:              'secret',
      password_confirmation: 'secret',
      vault_attributes: {
        subdomain: 'my-subdomain'
      }
    }
  end
  specify do
    response, operation = User::Create.run(user: attributes)
    expect(response).to be_truthy
    expect(operation.model).to be_persisted
    # response, operation = User::Create.run(user: attributes)
    # expect(response).to be_falsey
  end

  # specify 'invalid' do
  #   response, operation = User::Create.run(user: { subdomain: '' })
  #   expect(response).to be_falsey
  #   expect(operation.model).to_not be_persisted
  #   expect(operation.contract.errors.to_s).to eql("{subdomain: [\"can't be blank\"]}")
  # end
end

describe User::Update do
  let(:user) do
    _, op = User::Create.run(user: { subdomain: 'me' })
    op.model
  end

  specify 'valid', skip: true do
    User::Update[
      id: user.id,
      user: { subdomain: 'foo' },
    ]
    expect(user.reload.subdomain).to eql('foo')
  end
end
