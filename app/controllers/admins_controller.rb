class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  autocomplete :admin, :nome
  
  def autocomplete_identificacao_login_nome
    term = params[:term]
    identificacoes_Login = Pub::IdentificacaoLogin.where('nome LIKE ?', "%#{term}%").order(:nome).all.limit(20)
    render :json => identificacoes_Login.map { |x| {:id => x.id, :label => x.nome, :value => x.nome }}
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
