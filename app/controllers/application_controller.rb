# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  include SslRequirement
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :expire_session
  before_filter :login_required
  
  protected
  
  def expire_session
    if logged_in?
      
      current_time = Time.now
      session[:expire_time] = current_time if session[:expire_time].nil?
      if session[:expire_time] < 3.minutes.ago
        session[:user_id] = nil
        session[:expire_time] = nil
        flash[:notice] = "Sua sessão expirou. Efetue o login novamente para continuar."
        store_target_location
        redirect_to login_url
      else
        session[:expire_time] = current_time
      end
    end
  end

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :card_number, :card_digits
end

