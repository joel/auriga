class Vault
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subdomain, type: String

  validates :subdomain, presence: true

  has_many :users
  has_many :goldbricks, dependent: :destroy
end
