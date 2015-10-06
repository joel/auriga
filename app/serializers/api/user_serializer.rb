class Api::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :theme, :locale, :time_zone, :current_sign_in_ip, :last_sign_in_ip,
    :unconfirmed_email, :current_sign_in_at, :last_sign_in_at, :confirmed_at, :confirmation_sent_at,
    :invitation_sent_at, :invitation_accepted_at, :invitation_limit, :security, :roles, :sign_in_count
end
