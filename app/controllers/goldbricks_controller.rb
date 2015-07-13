class GoldbricksController < ApplicationController
  before_action :set_goldbrick, only: [:show, :edit, :update, :destroy]

  # GET /goldbricks
  def index
    @goldbricks = Goldbrick.all
  end

  # GET /goldbricks/1
  def show
  end

  # GET /goldbricks/new
  def new
    @goldbrick = Goldbrick.new
  end

  # GET /goldbricks/1/edit
  def edit
  end

  # POST /goldbricks
  def create
    @goldbrick = Goldbrick.new(goldbrick_params)
    @goldbrick.vault = current_vault

    if @goldbrick.save
      # redirect_to [current_vault, @goldbrick], notice: I18n.t('controllers.goldbrick.create.success') # 'Goldbrick was successfully created.'
      # vault_goldbrick_url(id: @goldbrick.id, subdomain: current_vault.subdomain)
      redirect_to @goldbrick, notice: I18n.t('controllers.goldbrick.create.success')
    else
      render :new
    end
  end

  # PATCH/PUT /goldbricks/1
  def update
    if @goldbrick.update(goldbrick_params)
      redirect_to @goldbrick, notice: I18n.t('controllers.goldbrick.update.success') # 'Goldbrick was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /goldbricks/1
  def destroy
    @goldbrick.destroy
    redirect_to goldbricks_url, notice: I18n.t('controllers.goldbrick.destroy.success') # 'Goldbrick was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goldbrick
      @goldbrick = current_vault.goldbricks.find(params[:id])
    rescue Mongoid::Errors::InvalidFind
    end

    # Only allow a trusted parameter "white list" through.
    def goldbrick_params
      params.require(:goldbrick).permit(:name, :link, :login, :password, :content)
    end
end
