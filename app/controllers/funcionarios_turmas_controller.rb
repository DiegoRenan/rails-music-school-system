class FuncionariosTurmasController < ApplicationController
  before_action :set_funcionarios_turma, only: [:show, :edit, :update, :destroy]

  # GET /funcionarios_turmas
  # GET /funcionarios_turmas.json
  def index
    @funcionarios_turmas = FuncionariosTurma.all
  end

  # GET /funcionarios_turmas/1
  # GET /funcionarios_turmas/1.json
  def show
  end

  # GET /funcionarios_turmas/new
  def new
    @funcionarios_turma = FuncionariosTurma.new
  end

  # GET /funcionarios_turmas/1/edit
  def edit
  end

  # POST /funcionarios_turmas
  # POST /funcionarios_turmas.json
  def create
    @funcionarios_turma = FuncionariosTurma.new(funcionarios_turma_params)

    respond_to do |format|
      if @funcionarios_turma.save
        format.html { redirect_to @funcionarios_turma, notice: 'Funcionarios turma was successfully created.' }
        format.json { render :show, status: :created, location: @funcionarios_turma }
      else
        format.html { render :new }
        format.json { render json: @funcionarios_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios_turmas/1
  # PATCH/PUT /funcionarios_turmas/1.json
  def update
    respond_to do |format|
      if @funcionarios_turma.update(funcionarios_turma_params)
        format.html { redirect_to @funcionarios_turma, notice: 'Funcionarios turma was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionarios_turma }
      else
        format.html { render :edit }
        format.json { render json: @funcionarios_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios_turmas/1
  # DELETE /funcionarios_turmas/1.json
  def destroy
    @funcionarios_turma.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_turmas_url, notice: 'Funcionarios turma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionarios_turma
      @funcionarios_turma = FuncionariosTurma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionarios_turma_params
      params.require(:funcionarios_turma).permit(:funcionarios_id, :turmas_id, :stauts)
    end
end
