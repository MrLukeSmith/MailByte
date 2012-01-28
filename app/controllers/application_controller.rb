class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  def index
  end
  
  def login
    if isLoggedIn
      redirect_to "/dashboard"
    end
  end
  
  def process_login
    email = params[:email]
    password = params[:password]
    u = User.where(:email => email, :password => password)
    if u.count == 0
      # not valid user
      @notice = "Invalid user"
      #redirect_to :login
    else
      # valid user. Register session. Redirect.
      @notice = "Valid user"
      session[:user] = u.first
      redirect_to "/dashboard"
    end
  end
  
  def logout
    session[:user] = nil
    redirect_to "/"
  end
  
  def register
    # Registration form? Or have login and registration in the same form ? 
  end
  
  def process_registration
    # check email isn't in use.
    # parse into DB.
    
  end
  
  def privacy_policy
    
  end
  
end
