class Vault
  class Create < Trailblazer::Operation
    include CRUD
    model Vault, :create

    contract do
      property :subdomain
      validates :subdomain, presence: true
    end

    def process(params)
      validate(params[:vault]) do |f|
        f.save
      end
    end
  end

  class Update < Create
    action :update
  end

  class Destroy < Update
    def process(params)
      model.destroy
      self
    end
  end
end
