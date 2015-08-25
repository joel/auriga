class DemoController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def fake_sign_in
    @user = User.where(email: 'john@passle.eu').first
    flash.now[:notice] = I18n.t('devise.sessions.signed_in') # "Signed in successfully"
    sign_in_and_redirect(@user)
  end
end
