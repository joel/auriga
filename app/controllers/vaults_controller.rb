class VaultsController < ApplicationController
  before_action :set_vault, only: [:show, :edit, :update, :destroy]

  # layout 'flatly'

  # GET /vaults
  def index
    @vaults = Vault.all
  end

  # GET /vaults/1
  def show
  end

  # GET /vaults/new
  def new
    @vault = Vault.new
  end

  # GET /vaults/1/edit
  def edit
  end

  # POST /vaults
  def create
    @vault = Vault.new(vault_params)

    if @vault.save
      redirect_to @vault, notice: 'Vault was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vaults/1
  def update
    if @vault.update(vault_params)
      redirect_to @vault, notice: 'Vault was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vaults/1
  def destroy
    @vault.destroy
    redirect_to vaults_url, notice: 'Vault was successfully destroyed.'
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
