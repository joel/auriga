class User < BasicModel
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  # Extra Field
  field :name,      type: String, default: ''
  field :theme,     type: String, default: 'readable'
  field :locale,    type: String, default: 'en'
  field :time_zone, type: String, default: 'Europe/Paris'

  include Mongoid::Multitenancy::Document
  tenant :vault, optional: true, full_indexes: true
  scope :authorized, ->{ where(vault: Mongoid::Multitenancy.current_tenant) }
  # tenant :vault, full_indexes: true

  # belongs_to :vault
  # validates :vault, presence: true
  # validates_associated :vault
  accepts_nested_attributes_for :vault

  index({ email: 1 }, { unique: true, background: true })
end
