class Vault
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subdomain, type: String
end
