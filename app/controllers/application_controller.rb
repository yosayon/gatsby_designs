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
  logged_in? ? current_user.current_order : temp_user.current_order
 end
 
 def require_login
  if !logged_in?
   redirect_to login_path
  end
 end
 
 def temp_user
   @temp_user ||= User.find_by_id(session[:temp_id])
 end
 
 def session_user
  if logged_in?
   @session_user = current_user
  else
   @session_user = temp_user
  end
 end
 
 def merge_cart_items
  current_cart.merge_cart_items_with(temp_user)
 end
 
 private
 
 def find_session_user
  if !logged_in? && session[:temp_id].nil?
   user = User.create_temporary_user
   session[:temp_id] = user.id
  end
 end
 
 def purge_temp_user_data
  if session[:temp_id]
   User.find_by_id(session[:temp_id]).delete
   Order.where(:user_id => session[:temp_id]).delete_all
   Cart.where(:user_id => session[:temp_id]).delete_all
   session.delete :temp_id
  end
 end
 
 def authenticate_user
  @user = User.find(params[:user_id])
  if session_user && @user != session_user || session_user.nil?
   render :file => "#{Rails.root}/public/422.html", :layout => false
  end
 end
 
end
