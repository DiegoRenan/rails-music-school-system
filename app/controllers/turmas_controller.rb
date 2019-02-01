class TurmasController < ApplicationController
  before_action :set_turma, only: [:show, :edit, :update, :destroy]

  # GET /turmas
  # GET /turmas.json
  def index
    @turmas = Turma.all.order("nome ASC")
    
    if params[:search]
    	@turmas = Turma.search(params[:search]).order("nome ASC")
  	else
    	@turmas = Turma.all.order("nome ASC")
  	end
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
  end

  # GET /turmas/new
  def new
    @turma = Turma.new
  end

  # GET /turmas/1/edit
  def edit
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = Turma.new(turma_params)

    respond_to do |format|
      if @turma.save
        format.html { redirect_to @turma, notice: 'Turma was successfully created.' }
        format.json { render :show, status: :created, location: @turma }
      else
        format.html { render :new }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    respond_to do |format|
      if @turma.update(turma_params)
        format.html { redirect_to @turma, notice: 'Turma was successfully updated.' }
        format.json { render :show, status: :ok, location: @turma }
      else
        format.html { render :edit }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    @turma.destroy
    respond_to do |format|
      format.html { redirect_to turmas_url, notice: 'Turma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_turma
      @turma = Turma.find(params[:id])
    end

    def turma_params
      params.require(:turma).permit(:nome, :inicio, :termino, :hora_inicio, :hora_fim, :dia, :turno, :instituicao_id, :curso_id)
    end

end
