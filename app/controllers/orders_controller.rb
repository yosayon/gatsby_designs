class OrdersController < ApplicationController
 before_action :require_login 
 before_action :authenticate_user, :only => [:show, :update, :index]
 
 def show
  @order = Order.find(params[:id])
 end
 
 def thank_you
  if !session_user
   redirect_to login_path
  end
 end
 
 def index
  @orders = current_user.checked_out_orders
 end
 
 private
 
 def order_params
  params.require(:order).permit(:user_id)
 end
 
end
