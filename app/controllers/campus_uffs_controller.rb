class CampusUffsController < ApplicationController
  before_action :set_campus_uff, only: [:show, :edit, :update, :destroy]
  layout 'admins'
  # GET /campus_uffs
  # GET /campus_uffs.json

  def index
    @campus_uffs = CampusUff.all
  end

  # GET /campus_uffs/1
  # GET /campus_uffs/1.json
  def show
  end

  # GET /campus_uffs/new
  def new
    if isAdmin
      @campus_uff = CampusUff.new
    else
      respond_to do |format|
        format.html { redirect_to campus_uffs_path, notice: 'Voce não tem permissão para cadastrar Campus UFF' }
        format.json { head :no_content }
      end
    end
  end

  # GET /campus_uffs/1/edit
  def edit
    if isAdmin
    else 
      respond_to do |format|
        format.html { redirect_to campus_uffs_path, notice: 'Voce não tem permissão para editar Campus UFF' }
        format.json { head :no_content }
      end
    end
  end

  # POST /campus_uffs
  # POST /campus_uffs.json
  def create
    
    @campus_uff = CampusUff.new(campus_uff_params)

    respond_to do |format|
      if @campus_uff.save
        format.html { redirect_to @campus_uff, notice: 'Campus uff was successfully created.' }
        format.json { render :show, status: :created, location: @campus_uff }
      else
        format.html { render :new }
        format.json { render json: @campus_uff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campus_uffs/1
  # PATCH/PUT /campus_uffs/1.json
  def update
    respond_to do |format|
      if @campus_uff.update(campus_uff_params)
        format.html { redirect_to @campus_uff, notice: 'Campus uff was successfully updated.' }
        format.json { render :show, status: :ok, location: @campus_uff }
      else
        format.html { render :edit }
        format.json { render json: @campus_uff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campus_uffs/1
  # DELETE /campus_uffs/1.json
  def destroy
    respond_to do |format|
      if isAdmin 
        @campus_uff.destroy
        format.html { redirect_to campus_uffs_url, notice: 'Campus uff was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to campus_uffs_url, notice: 'Você não tem permissão para excluir campus UFF' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campus_uff
      @campus_uff = CampusUff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campus_uff_params
      params.require(:campus_uff).permit(:nome, :endereco, :numero, :bairro, :cep, :cidade)
    end

    def isAdmin
      Admin.where(:dados_identificacoes_id => Pub::IdentificacaoLogin.find_by(iduff: current_user.iduff), :data_desativacao => nil).any?
    end
end
