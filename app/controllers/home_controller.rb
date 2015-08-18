class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  skip_around_action :scope_current_vault

  def index
    respond_to do |format|
      format.html { render :index }
      format.json { sleep(1); render json: { application: 'auriga' }}
    end
  end

end
