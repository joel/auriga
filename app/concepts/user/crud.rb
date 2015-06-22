class User
  class Create < Trailblazer::Operation
    include CRUD
    model User, :create

    contract do
      property :name
      property :theme
      property :locale
      property :time_zone
      property :email
      property :encrypted_password

      ## Form submission
      property :password
      property :password_confirmation

      ## Recoverable
      property :reset_password_token
      property :reset_password_sent_at

      ## Rememberable
      property :remember_created_at

      ## Trackable
      property :sign_in_count
      property :current_sign_in_at
      property :last_sign_in_at
      property :current_sign_in_ip
      property :last_sign_in_ip

      ## Confirmable
      property :confirmation_token
      property :confirmed_at
      property :confirmation_sent_at
      property :unconfirmed_email

      # Extra Field
      property :name
      property :theme
      property :locale
      property :time_zone

      # validates :email, presence: true, uniqueness: { case_sensitive: false }
    end

    def process(params)
      validate(params[:user]) do |f|
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
