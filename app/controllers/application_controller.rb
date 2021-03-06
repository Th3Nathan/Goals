class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    #fetches user that is logged in
    return nil unless session[:session_token] #next line would throw an error if we call user.find with nothing
    @user ||= User.find_by_session_token(session[:session_token])
  end 

  def log_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end 

  def log_out!
    session[:session_token] = nil
  end 

  helper_method :current_user
end
