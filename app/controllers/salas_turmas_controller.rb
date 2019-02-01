class SalasTurmasController < ApplicationController
  before_action :set_salas_turma, only: [:show, :edit, :update, :destroy]

  # GET /salas_turmas
  # GET /salas_turmas.json
  def index
    @salas_turmas = SalasTurma.all
  end
  
  # GET /salas_turmas/1
  # GET /salas_turmas/1.json
  def show
  end

  # GET /salas_turmas/new
  def new
    @salas_turma = SalasTurma.new
  end

  # GET /salas_turmas/1/edit
  def edit
  end

  # POST /salas_turmas
  # POST /salas_turmas.json
  def create
    @salas_turma = SalasTurma.new(salas_turma_params)

    respond_to do |format|
      if @salas_turma.save
        format.html { redirect_to @salas_turma, notice: 'Salas turma was successfully created.' }
        format.json { render :show, status: :created, location: @salas_turma }
      else
        format.html { render :new }
        format.json { render json: @salas_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas_turmas/1
  # PATCH/PUT /salas_turmas/1.json
  def update
    respond_to do |format|
      if @salas_turma.update(salas_turma_params)
        format.html { redirect_to @salas_turma, notice: 'Salas turma was successfully updated.' }
        format.json { render :show, status: :ok, location: @salas_turma }
      else
        format.html { render :edit }
        format.json { render json: @salas_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas_turmas/1
  # DELETE /salas_turmas/1.json
  def destroy
    @salas_turma.destroy
    respond_to do |format|
      format.html { redirect_to salas_turmas_url, notice: 'Salas turma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salas_turma
      @salas_turma = SalasTurma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salas_turma_params
      params.require(:salas_turma).permit(:salas_id, :turmas_id, :status)
    end
end
