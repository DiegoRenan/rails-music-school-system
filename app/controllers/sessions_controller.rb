class SessionsController < ApplicationController
  layout false
  #layout 'application', :except => :view
  def new
  end
  
  def create
    user = Usuario.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to alunos_path
    else
      @error = 'login/password Invalido'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to login_path
  end
end
