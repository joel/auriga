# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vault = Vault.create!({ subdomain: 'me' })

Mongoid::Multitenancy.with_tenant(vault) do
  user  = User.new({
    name:                  'Joel AZEMAR',
    email:                 'joel@auriga.dev',
    password:              'secret',
    password_confirmation: 'secret'
  })
  user.vault = vault
  user.save
  user.confirm!

  goldbrick = Goldbrick.new({
    name:     'Github',
    link:     'https://github.com',
    login:    'joel',
    password: 'secret',
    content:  'Main account',
  })
  goldbrick.vault = vault
  goldbrick.save
end
