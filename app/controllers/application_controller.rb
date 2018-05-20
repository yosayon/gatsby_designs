class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 helper_method :current_user, :logged_in?, :current_cart, :current_order, :session_user

 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end
 
 def logged_in?
  current_user != nil
 end
 
 def current_cart
  logged_in? ? current_user.current_cart : temp_user.current_cart
 end
 
 def current_order
  if logged_in?
   current_user.current_order
  else 
   temp_user.current_order
  end
 end
 
 def require_login
  if !logged_in?
   redirect_to login_path
  end
 end
 
 def temp_user
  session[:temp_id].nil? ? @temp_user ||= User.create_temporary_user : @temp_user ||= User.find(session[:temp_id]) 
 end
 
 def session_user
  if logged_in?
   @session_user = current_user
  else
   @session_user = temp_user
  end
 end
 
 def current_url
  #session[:current_url] = request.original_url
 end
 
 def merge_cart_items
  #raise temp_user.cart.line_items.inspect
 end
 
end
