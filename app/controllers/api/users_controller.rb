class Api::UsersController < ApplicationController
  respond_to :json

  skip_before_action :authenticate_user!
  skip_around_action :scope_current_vault

  # GET /api/users
  # GET /api/users.json
  def index
    @users = User.all

    respond_with do |format|
      format.json do
        render json: @users,
           each_serializer: Api::UserSerializer,
           root: 'users'
      end
    end
  end
end
