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

  belongs_to :vault
  # validates :vault, :login, presence: true
  # validates_associated :vault

  def safe_name
    return 'undefined' if name.blank?
    name
  end
end
