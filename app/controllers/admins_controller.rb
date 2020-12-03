class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  def autocomplete_admin_nome
    term = params[:term]
    brand_id = params[:brand_id]
    country = params[:country]
    products = Admin.where('brand = ? AND country = ? AND name LIKE ?', brand_id, country, "%#{term}%").order(:name).all
    render :json => products.map { |product| {:id => product.id, :label => product.name, :value => product.name} }
  end
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def ativar
    set_admin
    @admin.update_attribute(:ativo, true)
    @admin.update_attribute(:data_desativacao, nil)
    
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Admin was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def desativar
    set_admin
    @admin.update_attribute(:ativo, false)
    @admin.update_attribute(:data_desativacao, Time.now)
    
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Admin was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:nome, :ativo, :dados_identificacoes_id, :data_desativacao)
    end

end
