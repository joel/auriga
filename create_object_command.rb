# vault = Vault.all.sample

def create_vault(subdomain)
  attributes = begin
    {
      subdomain: subdomain,
    }
  end
  response, operation = Vault::Create.run(vault: attributes)
  vault = operation.model
  vault.save
  vault
end

def create_user(numero, vault)
  user = nil
  Mongoid::Multitenancy.with_tenant(vault) do
    attributes = begin
      {
        name:                  "#{numero} #{Faker::Name.first_name} #{Faker::Name.last_name}",
        email:                 Faker::Internet.email,
        password:              'secret',
        password_confirmation: 'secret',
        # vault_attributes: {
        #   subdomain: 'my-subdomain'
        # }
      }
    end

    response, operation = User::Create.run(user: attributes)
    user = operation.model
    user.vault = vault
    user.confirm!
  end
  user
end

vault_me = create_vault('me')
Mongoid::Multitenancy.current_tenant = vault_me
(1..5).each do |numero|
  create_user(numero, vault_me)
end
User.count
# => 5
User.all.map(&:name)
User.authorized.map(&:name)

vault_you = create_vault('you')
Mongoid::Multitenancy.current_tenant = vault_you
create_user('6', vault_you)
User.count
# => 1
User.all.map(&:name)
# => ["6 Edward Schiller"]
User.authorized.map(&:name)
# => ["6 Edward Schiller"]

Mongoid::Multitenancy.current_tenant = nil
User.count
# => 6

numero = 7
attributes = begin
  {
    name:                  "#{numero} #{Faker::Name.first_name} #{Faker::Name.last_name}",
    email:                 Faker::Internet.email,
    password:              'secret',
    password_confirmation: 'secret',
    # vault_attributes: {
    #   subdomain: 'my-subdomain'
    # }
  }
end

response, operation = User::Create.run(user: attributes)
user = operation.model
user.confirm!

User.all.map(&:name)

Mongoid::Multitenancy.current_tenant = vault_you
User.all.map(&:name)
# => ["6 Edward Schiller", "7 Craig Bechtelar"] (Added without tenant)
User.authorized.map(&:name)
# => ["6 Edward Schiller"]

# Assign tenant
Mongoid::Multitenancy.current_tenant = vault_we
vault_we = create_vault('we')
user.vault = vault_we
user.save

Mongoid::Multitenancy.current_tenant = vault_we
User.count
# => 1
User.all.map(&:name)
# => ["7 Nestor Wuckert"]
User.authorized.map(&:name)
# => []

Mongoid::Multitenancy.current_tenant = vault_you
User.all.map(&:name)
# => ["6 Bernita Douglas"]
User.authorized.map(&:name)
# => ["6 Bernita Douglas"]

Mongoid::Multitenancy.current_tenant = vault_me
User.all.map(&:name)
# => ["1 Cicero Bruen", "2 Selina Franecki", "3 Rafael Crooks", "4 Esther Veum", "5 Taylor Thiel", "7 Junius Volkman"]
User.authorized.map(&:name)
# => ["1 Cicero Bruen", "2 Selina Franecki", "3 Rafael Crooks", "4 Esther Veum", "5 Taylor Thiel"]

Moped.logger = Logger.new($stdout)
Moped.logger.level = Logger::DEBUG
User.where(vault: Mongoid::Multitenancy.current_tenant.id).all.entries



#
#
#
#
#
# user = create_user('7', vault_we)
# name = user.name
# User.where(name: name).exists?
#
# Mongoid::Multitenancy.current_tenant = vault_you
# user.vault = vault_you
# User.where(name: name).exists?
#
# Mongoid::Multitenancy.current_tenant = vault_me
# User.where(name: name).exists?





#
#
# attributes = begin
#   {
#     subdomain: 'me',
#   }
# end
# response, operation = Vault::Create.run(vault: attributes)
# vault = operation.model
# vault.save
#
# Mongoid::Multitenancy.current_tenant = vault
#
# 1.upto(5).each do |numero|
#   create_user(numero)
# end
#
# User.count
# Mongoid::Multitenancy.current_tenant = nil
# User.count
#
# attributes = begin
#   {
#     subdomain: 'you',
#   }
# end
# response, operation = Vault::Create.run(vault: attributes)
# vault = operation.model
# vault.save
#
# create_user(6)
#
#
#
# Mongoid::Multitenancy.with_tenant(vault) do
#   attributes = begin
#     {
#       name:                  "#{Faker::Name.first_name} #{Faker::Name.last_name}",
#       email:                 Faker::Internet.email,
#       password:              'secret',
#       password_confirmation: 'secret',
#       # vault_attributes: {
#       #   subdomain: 'my-subdomain'
#       # }
#     }
#   end
#
#   response, operation = User::Create.run(user: attributes)
#   operation.model.confirm!
# end
#
# Mongoid::Multitenancy.current_tenant = vault
# User.count
#
# # Mongoid::Multitenancy.with_tenant(vault) do
# #   User.count
# # end
#
# Mongoid::Multitenancy.current_tenant = nil
# attributes = begin
#   {
#     name:                  "#{Faker::Name.first_name} #{Faker::Name.last_name}",
#     email:                 Faker::Internet.email,
#     password:              'secret',
#     password_confirmation: 'secret',
#   }
# end
# response, operation = User::Create.run(user: attributes)
# operation.model.confirm!
# operation.model.vault
#
# operation.model.vault = Vault.all.sample
# operation.model.save
#
#
# vault = Vault.all.sample
# Mongoid::Multitenancy.current_tenant = vault
# attributes = begin
#   {
#     name:                  "#{Faker::Name.first_name} #{Faker::Name.last_name}",
#     email:                 Faker::Internet.email,
#     password:              'secret',
#     password_confirmation: 'secret',
#   }
# end
# response, operation = User::Create.run(user: attributes)
# operation.model.confirm!
# operation.model.vault
