# Tasks runned by the heroku scheduler add-on

namespace :seeds do

  # run nightly
  desc <<-DESC
    Add and reset set of demo data
  DESC
  task demo: :environment do
    if (request = Vault.where({subdomain: 'demo'})).exists?
      vault = request.first
      Mongoid::Multitenancy.with_tenant(vault) do
        puts("Remove #{User.count} users")
        User.destroy_all
      end
      puts("Remove subdomain #{vault.subdomain}")
      vault.destroy
    end
    Rake::Task['db:seed'].execute
  end
end
