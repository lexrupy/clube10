class UsersController < ApplicationController
  
  ssl_required :new, :create
  
  skip_before_filter :login_required, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Obrigado por se cadastrar! Você está logado agora."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def show
  
  end
  
end
