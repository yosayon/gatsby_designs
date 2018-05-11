class SessionsController < ApplicationController
 
 def new
  @user = User.new
 end
 
 def create
  if auth
   @user = User.find_or_create_by_omniauth(auth)
   session[:user_id] = @user.id
   redirect_to root_path
  else
   @user = User.find_by(:email => params[:email])
   if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to root_path
   else
    @user = User.new
    flash[:message] = "User not found"
    render :new
   end
  end
 end
 
 def destroy
  session.delete :user_id
  redirect_to :root
 end
 
 private
 
 def auth
  request.env['omniauth.auth']
 end
 
 def user_params
  params.require(:users).permit(:email, :password)
 end 
end