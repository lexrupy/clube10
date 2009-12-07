class ReservesController < ApplicationController

  def index
    @reserves = current_user.reserves
  end

  def new
    @reserve = Reserve.new(:court_id => 4)
  end
  
  def create
    @reserve = Reserve.new(params[:reserve])
    @reserve.user = current_user
    if @reserve.save
      flash[:notice] = "Obrigado! Sua reserva foi relizada com sucesso"
      redirect_to reserves_path
    else
      render :action => 'new'
    end
  end
  
  def court_value
    c = Court.find(params[:court_id])
    c.value
  end

end

