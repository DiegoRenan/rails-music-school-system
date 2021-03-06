class InstituicaosController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "super", except: [:index, :show]
  before_action :set_instituicao, only: [:show, :edit, :update]

  # GET /instituicaos
  # GET /instituicaos.json
  def index
    @instituicaos = Instituicao.all
  end

  # GET /instituicaos/1
  # GET /instituicaos/1.json
  def show
  end

  # GET /instituicaos/new
  def new
    @instituicao = Instituicao.new
  end

  # GET /instituicaos/1/edit
  def edit
  end

  # POST /instituicaos
  # POST /instituicaos.json
  def create
    @instituicao = Instituicao.new(instituicao_params)

    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to @instituicao, notice: 'Instituição criada com sucesso.' }
        format.json { render :show, status: :created, location: @instituicao }
      else
        format.html { render :new }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituicaos/1
  # PATCH/PUT /instituicaos/1.json
  def update
    respond_to do |format|
      if @instituicao.update(instituicao_params)
        format.html { redirect_to @instituicao, notice: 'Instituicão atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @instituicao }
      else
        format.html { render :edit }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituicaos/1
  # DELETE /instituicaos/1.json
  def destroy
    @instituicao.destroy
    respond_to do |format|
      format.html { redirect_to instituicaos_url, notice: 'Instituição foi removida.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituicao
      @instituicao = Instituicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instituicao_params
      params.require(:instituicao).permit(:cnpj, :insc_estadual, :razao_social, :nome_fantasia,:endereco,:telefone, :email, :responsavel)
      #params.fetch(:instituicao, {})
    end
end
