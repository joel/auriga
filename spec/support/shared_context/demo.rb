shared_context 'demo' do
  let(:vault) do
    Vault.create!({ subdomain: 'demo' })
  end
  let!(:user) do
    Mongoid::Multitenancy.with_tenant(vault) do
      user  = User.new({
        name:                  'John Doe',
        email:                 'john@passle.eu',
        password:              'password',
        password_confirmation: 'password'
      })
      user.vault = vault
      user.save

      user.confirm

      user
    end
  end
end
