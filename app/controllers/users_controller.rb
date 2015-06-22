class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show() end

  # GET /users/1/edit
  def edit() end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    run User::Create do |operation|
      return redirect_to operation.model
    end

    render action: :edit
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    run User::Destroy do
      redirect_to users_url, notice: I18n.t('controller.users.destroy.success')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
