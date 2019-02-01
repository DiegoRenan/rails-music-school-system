class ResponsavelsController < ApplicationController
  before_action :set_responsavel, only: [:show, :edit, :update, :destroy]

  # GET /responsavels
  # GET /responsavels.json
  def index
    @responsavels = Responsavel.all.order("nome ASC")
    
    if params[:search]
    	@responsavels = Responsavel.search(params[:search]).order("nome ASC")
  	else
    	@responsavels = Responsavel.all.order("nome ASC")
  	end
  end

  # GET /responsavels/1
  # GET /responsavels/1.json
  def show
  end

  # GET /responsavels/new
  def new
    @responsavel = Responsavel.new
  end

  # GET /responsavels/1/edit
  def edit
  end

  # POST /responsavels
  # POST /responsavels.json
  def create
    @responsavel = Responsavel.new(responsavel_params)

    respond_to do |format|
      if @responsavel.save
        format.html { redirect_to @responsavel, notice: 'Responsavel was successfully created.' }
        format.json { render :show, status: :created, location: @responsavel }
      else
        format.html { render :new }
        format.json { render json: @responsavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsavels/1
  # PATCH/PUT /responsavels/1.json
  def update
    respond_to do |format|
      if @responsavel.update(responsavel_params)
        format.html { redirect_to @responsavel, notice: 'Responsavel was successfully updated.' }
        format.json { render :show, status: :ok, location: @responsavel }
      else
        format.html { render :edit }
        format.json { render json: @responsavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsavels/1
  # DELETE /responsavels/1.json
  def destroy
    @responsavel.destroy
    respond_to do |format|
      format.html { redirect_to responsavels_url, notice: 'Responsavel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsavel
      @responsavel = Responsavel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsavel_params
      params.require(:responsavel).permit(:cpf, :rg, :nome, :data_nascimento, :estado_civil, :telefone, :celular, :email, :profissao, :endereco, :numero, :bairro, :cep, :cidade, :uf)
    end
end
