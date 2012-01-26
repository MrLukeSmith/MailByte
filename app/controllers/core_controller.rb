class CoreController < ActionController::Base
  protect_from_forgery
  layout "application"  
  
  def dashboard
	@c = Campaign.where(:user_id => session[:user][:id])
  end
  
  def readme
  
  end
  
 end
  
