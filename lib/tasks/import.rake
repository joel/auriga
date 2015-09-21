namespace :import do

  namespace :from do

    # data = {
    #   headers: {
    #     vault: [],
    #     user:  []
    #   },
    #   data: {
    #     vaults: [{ subdomain: vault.subdomain,
    #       users:      [],
    #       goldbricks: []
    #     }]
    #   }
    # }

    desc <<-DESC
      bundle exec rake import:from:yaml
    DESC
    task yaml: :environment do |t, args|

      Vault.destroy_all

      data = YAML.load(File.open('data.yml').read)

      data[:data][:vaults].each do |vault_params|
        vault = Vault.create!({ subdomain: vault_params[:subdomain] })

        Mongoid::Multitenancy.with_tenant(vault) do

          vault_params[:users].each do |user_params|
            puts("Create user #{user_params[:name]} #{user_params[:email]}")
            user  = User.new({
              name:                  user_params[:name],
              email:                 user_params[:email],
              password:              'secret',
              password_confirmation: 'secret'
            })
            user.vault = vault
            user.save

            puts("Confirm user #{user_params[:name]}")
            user.confirm

            puts("Update extra informations")
            user.assign_attributes(user_params.except(*[:name, :email, :invited_by_id]))

            puts("Update password #{user_params[:name]} #{user_params[:email]} with #{user_params[:encrypted_password]}")
            # user.update_attribute(:encrypted_password, user_params[:encrypted_password])
            User.collection.where({ _id: user.id }).update({
              "$set" => { encrypted_password: user_params[:encrypted_password] }
            })
          end

          vault_params[:goldbricks].each do |goldbrick_params|
            puts("Create goldbrick entr (#{goldbrick_params[:name]})")
            goldbrick = vault.goldbricks.new({
              name:     goldbrick_params[:name],
              link:     goldbrick_params[:link],
              login:    goldbrick_params[:login],
              password: goldbrick_params[:password],
              content:  goldbrick_params[:content],
            })
            goldbrick.vault = vault
            goldbrick.save
          end
        end
      end

    end
  end
end
