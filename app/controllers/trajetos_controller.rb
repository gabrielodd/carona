class TrajetosController < ApplicationController
  before_action :set_trajeto, only: [:show, :edit, :update, :destroy]
  autocomplete :trajeto, :observacoes

  # GET /trajetos
  # GET /trajetos.json
  def index
    @trajetos = Trajeto.where(identificacao_login_id: Pub::IdentificacaoLogin.find_by(iduff: current_user.iduff))
  end

  # GET /trajetos/1
  # GET /trajetos/1.json
  def show
  end

  # GET /trajetos/new
  def new
    @trajeto = Trajeto.new
  end

  # GET /trajetos/1/edit
  def edit
    if isOwner(@trajeto)
    else
      respond_to do |format|
        format.html { redirect_to trajetos_url, notice: 'Você não tem permissão para editar essa carona!' }
        format.json { head :no_content }
      end
    end
  end

  # POST /trajetos
  # POST /trajetos.json
  def create
    @trajeto = Trajeto.new(trajeto_params)

    respond_to do |format|
      if @trajeto.save
        format.html { redirect_to @trajeto, notice: 'Trajeto was successfully created.' }
        format.json { render :show, status: :created, location: @trajeto }
      else
        format.html { render :new }
        format.json { render json: @trajeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trajetos/1
  # PATCH/PUT /trajetos/1.json
  def update
    respond_to do |format|
      if @trajeto.update(trajeto_params)
        format.html { redirect_to @trajeto, notice: 'Trajeto was successfully updated.' }
        format.json { render :show, status: :ok, location: @trajeto }
      else
        format.html { render :edit }
        format.json { render json: @trajeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trajetos/1
  # DELETE /trajetos/1.json
  def destroy
    respond_to do |format|
      if isOwner(@trajeto)
        @trajeto.destroy
        format.html { redirect_to trajetos_url, notice: 'Trajeto was successfully destroyed.' }
        format.json { head :no_content }
      else 
        format.html { redirect_to trajetos_url, notice: 'Você não tem permissão para excluir essa carona!!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trajeto
      @trajeto = Trajeto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trajeto_params
      params.require(:trajeto).permit(:local_partida, :local_destino, :horario, :passageiros, :valor, :observacao, :identificacao_login_id,
        local_intermediarios_attributes: [:id, :local, :_destroy])
    end

    def isOwner(trajeto)
      trajeto.identificacao_login_id == Pub::IdentificacaoLogin.find_by(iduff: current_user.iduff).id
    end
end
