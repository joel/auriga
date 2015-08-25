class Vault
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subdomain, type: String

  validates :subdomain, presence: true
  validates_uniqueness_of :subdomain, case_sensitive: true, allow_blank: false
  validates_format_of :subdomain, with: /^[a-z0-9-]+$/,
    message: I18n.t('mongoid.errors.models.vault.attributes.subdomain.format'), multiline: true
  validates_length_of :subdomain, maximum: 32
  validates_exclusion_of :subdomain, in: ['www', 'mail', 'ftp']

  has_many :users
  has_many :goldbricks, dependent: :destroy
end
