class MatriculasController < ApplicationController
  before_action :set_matricula, only: [:show, :edit, :update, :destroy]
  # GET /matriculas
  # GET /matriculas.json
  def index
    @matriculas = Matricula.all
    
    if params[:search]
    	@matriculas = Matricula.search(params[:search]).order("created_at ASC")
  	else
    	@matriculas = Matricula.all.order("created_at ASC")
  	end
  end

  # GET /matriculas/1
  # GET /matriculas/1.json
  def show
	@numero_parcelas = 1 +(@matricula.data_fim_contrato.year * 12 + @matricula.data_fim_contrato.month) - 
	(@matricula.data_inicio_contrato.year * 12 + @matricula.data_inicio_contrato.month)
	
	if !@matricula.turma.nil?
		@calcular_valor_total = @matricula.turma.curso.valor.to_f * @numero_parcelas
		@calcular_valor_total = @matricula.turma.curso.valor.to_f * @numero_parcelas
		@valor_total = Money.new(@calcular_valor_total*100, "BRL").format
		@valor_parcela = Money.new(@matricula.turma.curso.valor.to_f*100, "BRL").format
		@responsavel = (@matricula.aluno.responsavel == nil) ? (@matricula.aluno) : (@matricula.aluno.responsavel)
	end

	
  end

  # GET /matriculas/new
  def new 
    @matricula = Matricula.new
  end

  # GET /matriculas/1/edit
  def edit
  end

  # POST /matriculas
  # POST /matriculas.json
  def create
    {:numero_parcelas=>@numero_parcelas}
    @matricula = Matricula.new(matricula_params)

    respond_to do |format|
      if @matricula.save
        format.html { redirect_to @matricula, notice: 'Matricula was successfully created.' }
        format.json { render :show, status: :created, location: @matricula }
      else
        format.html { render :new }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matriculas/1
  # PATCH/PUT /matriculas/1.json
  def update
    respond_to do |format|
      if @matricula.update(matricula_params)
        format.html { redirect_to @matricula, notice: 'Matricula was successfully updated.' }
        format.json { render :show, status: :ok, location: @matricula }
      else
        format.html { render :edit }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matriculas/1
  # DELETE /matriculas/1.json
  def destroy
    @matricula.destroy
    respond_to do |format|
      format.html { redirect_to matriculas_url, notice: 'Matricula was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

	  # Use callbacks to share common setup or constraints between actions.
		def set_matricula
			@matricula = Matricula.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def matricula_params
			params.require(:matricula).permit(:status_matricula, :data_inicio_matricula, :data_inicio_contrato, :data_fim_contrato, :turma_id, :aluno_id, :numero_parcelas, :status_contrato, :dia_vencimento)
		end 

end
