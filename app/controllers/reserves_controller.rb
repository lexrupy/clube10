class ReservesController < ApplicationController

  def index
    @reserves = current_user.reserves.valid_reserves
  end

  def new
    @reserve = Reserve.new(:court_id => 4)
  end
  
  def create
    @last_reserve = current_user.reserves.last(:order => 'created_at DESC')
    if @last_reserve.created_at > 30.seconds.ago
      flash[:notice] = "Você já fez uma reserva a menos de 30 segundos... por favor, aguarde o processamento da reserva anterior antes de continuar."
      return redirect_to reserves_path
    end
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
    @court = Court.find(params[:court_id])
    @court
  end

end

