class MensalidadesController < ApplicationController
  before_action :set_mensalidade, only: [:show, :edit, :update, :destroy]

  # GET /mensalidades
  # GET /mensalidades.json
  def index
    @mensalidades = Mensalidade.all
	  #@result = Mensalidade.search(params[:search])    
    if params[:search]
    	@mensalidades = Mensalidade.search(params[:search])
  	else
    	@mensalidades = Mensalidade.all
  	end
	
	if params[:seleciona]
		@mensalidades = Mensalidade.seleciona(params[:seleciona])
	end
  end

  # GET /mensalidades/1
  # GET /mensalidades/1.json
  def show
	@juros = calcula_juros.round(2)
	@valor_pago = @mensalidade.valor_pago
	if @mensalidade.status == "pago"
		@valor_total = 0.0
	end
  end

  # GET /mensalidades/new
  def new
    @mensalidade = Mensalidade.new  
  end

  # GET /mensalidades/1/edit
  def edit
	@juros = calcula_juros.round(2)
	@valor_pago = @mensalidade.valor_pago
	@valor_sub = (@juros + @mensalidade.valor) - @valor_pago
	@valor_total = @valor_sub.round(2)
  end

  # POST /mensalidades
  # POST /mensalidades.json
  def create
    
	@matricula = Matricula.find(params[:matricula_id])
	@numero_parcelas = (@matricula.data_fim_contrato.year * 12 + @matricula.data_fim_contrato.month) - 
	(@matricula.data_inicio_contrato.year * 12 + @matricula.data_inicio_contrato.month)
	
	carner
	
  	#respond_to do |format|
  	#	if @mensalidade.save
  	#		format.html { redirect_to @mensalidade, notice: 'Mensalidade was successfully created.' }
  	#	  format.json { render :show, status: :created, location: @mensalidade }
  	#	else
  	#		format.html { render :new }
  	#		format.json { render json: @mensalidade.errors, status: :unprocessable_entity }
  	#	end 
  	#end
  end
  
  # PATCH/PUT /mensalidades/1
  # PATCH/PUT /mensalidades/1.json
  def update
    respond_to do |format|
      if @mensalidade.update(mensalidade_params)
        format.html { redirect_to @mensalidade, notice: 'Mensalidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensalidade }
      else
        format.html { render :edit }
        format.json { render json: @mensalidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensalidades/1
  # DELETE /mensalidades/1.json
  def destroy
    @mensalidade.destroy
    respond_to do |format|
      format.html { redirect_to mensalidades_url, notice: 'Mensalidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensalidade
      @mensalidade = Mensalidade.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def mensalidade_params
      params.require(:mensalidade).permit(:codigo, :data_emissao, :data_vencimento, :numero, :valor, :desconto, :valor_desconto, :juros, :valor_pago,:matricula_id, :status)
    end
	
	def calcula_juros
		@days = (Date.today - @mensalidade.data_vencimento).to_i
		if @days > 0
			@mora = @mensalidade.valor * 0.03
			@juros = (@mora/30) * @days
		else
			@juros = 0
		end
	end
	
	def carner
			@rand = Random.new
			@data_emissao = Time.now
			@valor_parcela = @matricula.turma.curso.valor.to_f
			@carne_status = 0
			
			for parcela in 1..@numero_parcelas
				
				@codigo = @matricula.id.to_s + parcela.to_s + @matricula.dia_vencimento.to_s + @matricula.turma.curso.id.to_s + Date.today.day.to_s + @rand.rand(0..100).to_s
				
				if parcela == 1
					@data_vencimento = Time.utc(Time.now.year, Time.now.month, @matricula.data_inicio_matricula.day)
					@mensalidade = Mensalidade.create([codigo: @codigo, data_emissao: @data_emissao, data_vencimento: @data_vencimento,
					numero: parcela, valor: @valor_parcela, desconto: 0.0, valor_desconto: @valor_parcela, juros: 0.0, valor_pago: 0.0, 
					matricula_id: @matricula.id, status: 'aberta'])
				elsif parcela < 13
					@month = Time.now.month + parcela
					@year = Time.now.year
					if @month > 12
						@month = @month - 12
						@year = Time.now.year.next
					end
					@data_vencimento = Time.utc(@year, @month, @matricula.dia_vencimento)
					@mensalidade = Mensalidade.create([codigo: @codigo,data_emissao: @data_emissao, data_vencimento: @data_vencimento, numero: parcela,valor: @valor_parcela,
					desconto: 0.0, valor_desconto: @valor_parcela,juros: 0.0,valor_pago: 0.0, matricula_id: @matricula.id,status: 'aberta'])
				end
			end
			respond_to do |format|
				if @mensalidade
					format.html { redirect_to matriculas_url, notice: 'Mensalidade was successfully saved.' }
					format.json { head :no_content }
				else
					format.html { redirect_to matriculas_url, notice: 'Mensalidade wasn´t successfully saved.' }
					format.json { head :no_content }
				end
			end
	end	
end
