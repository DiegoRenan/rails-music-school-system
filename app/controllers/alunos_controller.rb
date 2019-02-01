class AlunosController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "super", except: [:index, :show, :edit, :new]
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  # GET /alunos
  # GET /alunos.json
  def index
    @alunos = Aluno.all.order("nome ASC")
    
    if params[:search]
    	@alunos = Aluno.search(params[:search]).order("nome ASC")
  	else
    	@alunos = Aluno.all.order("nome ASC")
  	end
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
    @aluno.data_nascimento = 25.years.ago
  end

  # GET /alunos/1/edit
  def edit
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno was successfully created.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
	if @aluno.nil?
		flash[:error] = "object is not not found"
	elsif @aluno.destroy
		flash[:notice] = 'blah'
		respond_to do |format|
			format.html { redirect_to alunos_url, notice: 'Aluno was successfully destroyed.' }
			format.json { head :no_content }
		end
	else
		flash[:error] = 'There was a problem fetching the record'
		redirect_to rejected_admin_entries_path
	end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:cpf, :rg, :nome, :data_nascimento, :estado_civil, :sexo, :telefone, :celular, :email, :profissao, :nome_pai, :nome_mae, :observacao, :parentesco_responsavel, :responsavel_id, :endereco, :numero, :bairro, :cep, :cidade, :uf)
    end
end
