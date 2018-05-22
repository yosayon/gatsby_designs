class UsersController < ApplicationController
 after_action :purge_temp_user_data, :only => [:create], :if => :logged_in?
 
 def new
  @user = User.new
 end
 
 def create
  @user = User.new(user_params)
  if @user.save
   session[:user_id] = @user.id
   merge_cart_items if session[:temp_id]
   redirect_to root_path
  else
   render :new
  end
 end
 
 def show
 end
 
 private
 
 def user_params
  params.require(:user).permit(:email, :password)
 end
 
end
