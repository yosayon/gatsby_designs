class SessionsController < ApplicationController
 after_action :purge_temp_user_data, :only => [:create], :if => :logged_in?
 
 def new
  @user = User.new
 end
 
 def create
  if auth
   @user = User.find_or_create_by_omniauth(auth)
   session[:user_id] = @user.id
   merge_cart_items if session[:temp_id]
   redirect_to root_path
  elsif
   @user = User.find_by(:email => params[:email])
   if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    merge_cart_items if session[:temp_id]
    redirect_to root_path
   end
  else
    @user = User.new
    flash[:message] = "User not found"
    redirect_to login_path
  end
 end
 
 def destroy
  session.delete :user_id
  session.delete :temp_id
  session.delete :product_id
  redirect_to root_path
 end
 
 private
 
 def auth
  request.env['omniauth.auth']
 end
 
 def user_params
  params.require(:user).permit(:email, :password)
 end 

end