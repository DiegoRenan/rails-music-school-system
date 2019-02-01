class ModelconsController < ApplicationController
	
  def index
    @modelcons = Modelcon.all
  end
  
  def show
	 @modelcon = Modelcon.find(params[:id])
  end
  
  def new
    @modelcon = Modelcon.new
  end
  
  def edit
	@modelcon = Modelcon.find(params[:id])
  end
  
  def create
    @modelcon = Modelcon.new(modelcon_params)

    respond_to do |format|
      if @modelcon.save
        format.html { redirect_to @modelcon, notice: 'Modelo was successfully created.' }
        format.json { render :show, status: :created, location: @modelcon }
      else
        format.html { render :new }
        format.json { render json: @modelcon.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
	@modelscon = Modelcon.find(params[:id])
    respond_to do |format|
      if @modelscon.update(modelcon_params)
        format.html { redirect_to @modelscon, notice: 'Curso was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelscon }
      else
        format.html { render :edit }
        format.json { render json: @modelscon.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
	@modelcon = Modelcon.find(params[:id])
    @modelcon.destroy
    respond_to do |format|
      format.html { redirect_to modelcons_url, notice: 'Curso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
	
	def modelcon_params
      params.require(:modelcon).permit(:titulo, :modelo)
    end

end
