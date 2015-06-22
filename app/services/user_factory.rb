class UserFactory < Struct.new(:vault)

  BASE_ATTRIBUTES   = %i(email).freeze
  CREATE_ATTRIBUTES = BASE_ATTRIBUTES + %i(name password password_confirmation).freeze
  # UPDATE_ATTRIBUTES = BASE_ATTRIBUTES

  def find_or_create!(params)

    params.with_indifferent_access
    if (email = params.fetch(:email, false))
      user = email
    end
    user = User.new(params.slice(*User.column_names))
    user.vault = vault
    user.save!
    user
  end

  private

  def valid_inputs(params)
    params = params.with_indifferent_access
    BASE_ATTRIBUTES.any? { |e| params.has_key?(e) }
  end

end
