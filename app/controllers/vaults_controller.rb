class VaultsController < ApplicationController
  skip_around_action :scope_current_vault, only: [:new]

  before_action :set_vault, only: [:show, :edit, :update, :destroy]

  # # GET /vaults
  # def index
  #   @vaults = Vault.all
  # end

  # GET /vaults/1
  def show() end

  # GET /goldbricks/new
  def new
    @vault = Vault.new
  end

  # GET /vaults/1
  def edit() end

  # POST /vaults
  def create
    @vault = Vault.new(vault_params)

    if @vault.save
      redirect_to @vault, notice: I18n.t('controllers.vault.create.success') # 'Vault was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vaults/1
  def update
    if @vault.update(user_params)
      redirect_to @vault, notice: I18n.t('controllers.vault.update.success') # 'Vault was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vaults/1
  def destroy
    @vault.destroy
    redirect_to vaults_url, notice: I18n.t('controllers.vault.destroy.success') # 'Vault was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vault
      @vault = Vault.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vault_params
      params.require(:vault).permit(:subdomain)
    end
end
