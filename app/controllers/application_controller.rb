class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 helper_method :current_user, :logged_in?
 
 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end
 
 def logged_in?
  current_user != nil
 end
 
 def current_cart
  current_user.current_cart if logged_in?
 end
 
 def current_order
  current_user.current_order if logged_in?
 end
 
end
