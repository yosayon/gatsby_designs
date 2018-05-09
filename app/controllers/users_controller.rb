class UsersController < ApplicationController
 before_action :find_user!, :only => [:create]
 
 def new
  @user = User.new
 end
 
 def show
 end
 
 private
 
 def user_params
  params.require(:user).permit(:name, :email, :password)
 end
 
 def find_user!
  @user = User.find(params[:id])
 end
end
