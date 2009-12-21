class ConfirmationsController < ApplicationController
  ssl_required :new, :create

  def new
    @reserve = current_user.reserves.find(params[:reserve_id])
    @confirmation = Confirmation.new(:reserve_id => params[:reserve_id])
    @have_credit = current_user.have_credit?(@reserve)
  end

  def create
    @reserve = current_user.reserves.find(params[:reserve_id])
    if @reserve
      @confirmation = Confirmation.new
      @confirmation.reserve = @reserve
      @confirmation.user = current_user
      @confirmation.credit_card = params[:payment_type] == 'card'
      @confirmation.card_number = params[:card_number]
      @confirmation.card_digits = params[:card_digits]
      @confirmation.value = @reserve.court_value
      
      if !@confirmation.credit_card? 
        unless current_user.have_credit?(@reserve)
          flash[:error] = "Créditos insuficientes para realizar a operação."
          return render :action => 'new'
        end
      end

      if @confirmation.save
        flash[:notice] = "Reserva confirmada com sucesso, você recebeu #{@confirmation.credits} créditos de bônus."
        redirect_to reserves_path
      else
        flash[:error] = "Problemas ao tentar confirmar sua reserva."
        render :action => :new
      end
    else
      flash[:error] = "Reserva não encontrada."
      render :action => :new
    end
      
  end

  def destroy
    @confirmation = current_user.confirmations.find(params[:id])
    @confirmation.destroy
    flash[:notice] = "Reserva cancelada com sucesso. você foi creditado em #{@confirmation.extra_credits} créditos."
    redirect_to reserves_path
  end

end
