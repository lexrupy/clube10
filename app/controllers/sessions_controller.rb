class SessionsController < ApplicationController

  ssl_required :new, :create

  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Login efetuado com sucesso."
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = "Usuário ou senha inválido."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Você saiu do sistema."
    redirect_to root_url
  end
end

