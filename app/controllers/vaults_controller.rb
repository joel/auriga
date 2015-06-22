class VaultsController < ApplicationController
  skip_around_filter :scope_current_vault, only: [:new]
  
  before_action :set_vault, only: [:show, :edit, :update, :destroy]

  # GET /vaults
  def index
    @vaults = Vault.all
  end

  # GET /vaults/1
  def show() end

  # GET /vaults/new
  def new
    form Vault::Create
  end

  # GET /vaults/1/edit
  def edit
    form Vault::Update
  end

  # POST /vaults
  def create
    run Vault::Create do |operation|
      return redirect_to operation.model
    end

    render action: :new
  end

  # PATCH/PUT /vaults/1
  def update
    run Vault::Update do |operation|
      return redirect_to operation.model
    end

    render action: :edit
  end

  # DELETE /vaults/1
  def destroy
    run Vault::Destroy do
      redirect_to vaults_url, notice: 'Vault was successfully destroyed.'
    end
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
