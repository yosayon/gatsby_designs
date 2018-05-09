class SessionsController < ApplicationController
  def create
   user = User.find_or_create_by(:id => auth['uid']) do |user|
   user.name = auth['info']['name']
   user.email = auth['info']['email']
   user.password = SecureRandom.hex
   end
   session[:user_id] = user.try(:id)
    render 'statics/home'
  end
 
 def new
  @user = User.new
 end
 
 def destroy
  session.delete :user_id
  redirect_to :root
 end
 
 private
 
 def auth
  request.env['omniauth.auth']
 end
end