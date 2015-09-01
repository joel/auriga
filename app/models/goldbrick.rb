class Goldbrick
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,      type: String
  field :link,      type: String
  field :login,     type: String
  field :password,  type: String
  field :content,   type: String
  field :security,  type: Integer, default: 0 # (0..5)

  validates :vault, :login, presence: true
  validates_associated :vault
  validates_uniqueness_of :login, case_sensitive: true, allow_blank: false

  belongs_to :vault

  def safe_name
    return 'undefined' if name.blank?
    name
  end
end
