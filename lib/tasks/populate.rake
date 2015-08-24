namespace :db do

  namespace :populate do

    desc <<-DESC
      Fill database with sample fake data
      bx rake db:populate:fake
    DESC
    task fake: :environment do |t, args|
      p args
      raise "You cannot use this task in #{Rails.env} !!" unless ([:development].include? Rails.env.to_sym)
      puts 'Tape \'Y\' for cleaning database'
      reset = args[:reset] || $stdin.gets.chomp

      if reset == 'Y'
        puts 'Reset database'
        Rake::Task['db:reset'].invoke
      else
        puts 'Okay bye!'
        exit 0
      end

      puts("Create subdomain me")
      vault = Vault.create!({ subdomain: 'me' })

      Mongoid::Multitenancy.with_tenant(vault) do
        puts("Create user Joel AZEMAR joel@auriga.dev")
        user  = User.new({
          name:                  'Joel AZEMAR',
          email:                 'joel@auriga.dev',
          password:              'secret',
          password_confirmation: 'secret'
        })
        user.vault = vault
        user.save

        puts("Confirm user Joel AZEMAR")
        user.confirm

        puts("Create one entry on goldbrick (Github)")
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

      puts("Done!")
    end
  end
end
