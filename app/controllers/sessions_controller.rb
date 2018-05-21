class SessionsController < ApplicationController
 #before_action :
 after_action :purge_temp_user_data, :only => [:create]
 
 def new
  @user = User.new
 end
 
 def create
  if auth
   @user = User.find_or_create_by_omniauth(auth)
   session[:user_id] = @user.id
  elsif
   @user = User.find_by(:email => params[:email])
   if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
   end
  else
   @user = User.new
   flash[:message] = "User not found"
   render :new
  end
   merge_cart_items if session[:temp_id]
   redirect_to root_path
 end
 
 def destroy
  session.delete :user_id
  #session.delete :temp_id
  redirect_to root_path
 end
 
 private
 
 def auth
  request.env['omniauth.auth']
 end
 
 def user_params
  params.require(:users).permit(:email, :password)
 end 
 


end