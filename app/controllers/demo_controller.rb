class DemoController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def fake_sign_in
    @user = User.where(email: 'john@passle.eu').first
    flash.now[:notice] = "Signed in successfully"
    sign_in_and_redirect(:user, @user)
  end
end
