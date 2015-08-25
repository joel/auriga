class VaultsController < ApplicationController
  skip_around_action :scope_current_vault, only: [:new, :create]

  # GET /goldbricks/new
  def new
    @vault = Vault.new
  end

  # POST /vaults
  def create
    @vault = Vault.new(vault_params)

    if @vault.save
      Mongoid::Multitenancy.with_tenant(@vault) do
        current_user.vault = @vault
        current_user.save
      end
      flash[:notice] = I18n.t('controllers.vault.create.success') # 'Vault was successfully created.'
      redirect_to vault_url(id: @vault, subdomain: @vault.subdomain)
    else
      render :new
    end
  end

  # DELETE /vaults/1
  def destroy
    current_vault.destroy
    redirect_to new_vault_url(subdomain: nil), notice: I18n.t('controllers.vault.destroy.success') # 'Vault was successfully destroyed.'
  end

  private

  def vault_params
    params.require(:vault).permit(:subdomain)
  end
end
