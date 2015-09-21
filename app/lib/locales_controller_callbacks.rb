module LocalesControllerCallbacks
  extend ActiveSupport::Concern

  included do
    skip_before_action :authenticate_user!
    skip_around_action :scope_current_vault
  end
end
