class ConfirmationsController < ApplicationController
  # ssl_required :new, :create

  def new
    @confirmation = Confirmation.new(:reserve_id => params[:reserve_id])
  end

  def create
    reserve = current_user.reserves.find(params[:reserve][:reserve_id])
    if reserve
      @confirmation = Confirmation.new
      @confirmation.reserve = reserve
      @confirmation.user = current_user
      @confirmation.credit_card = params[:reserve][:credit_card]
    end
      
  end

  def destroy
    @confirmation = current_user.confirmations.find(params[:id])
    @confirmation.destroy
  end

end
