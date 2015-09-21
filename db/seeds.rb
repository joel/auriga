# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vault = nil
if (request = Vault.where({subdomain: 'demo'})).exists?
  puts("Subdomain demo already exists")
  vault = request.first
else
  puts("Create subdomain demo")
  vault = Vault.create!({ subdomain: 'demo' })
end

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

  ['Facebook', 'Twitter', 'Linkedin', 'Github'].each do |name|
    puts("Create one fake entry (#{name})")
    goldbrick = Goldbrick.new({
      name:     name,
      link:     "http://www.#{name.downcase}.com",
      login:    'demo@example.com',
      password: Faker::Internet.password(10, 20),
      content:  "#{name} account",
    })
    goldbrick.vault = vault
    goldbrick.save
  end
end

puts("Done!")
