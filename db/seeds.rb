# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts("Create subdomain demo")
vault = Vault.create!({ subdomain: 'demo' })

Mongoid::Multitenancy.with_tenant(vault) do
  puts("Create user John Doe john@passle.eu")
  user  = User.new({
    name:                  'John Doe',
    email:                 'john@passle.eu',
    password:              'password',
    password_confirmation: 'password'
  })
  user.vault = vault
  user.save

  puts("Confirm user John Doe")
  user.confirm

  puts("Create one fake entry on goldbrick (Github)")
  goldbrick = Goldbrick.new({
    name:     'Github',
    link:     'https://github.com',
    login:    'john',
    password: Faker::Internet.password(10, 20),
    content:  'Main account',
  })
  goldbrick.vault = vault
  goldbrick.save
end

puts("Done!")
