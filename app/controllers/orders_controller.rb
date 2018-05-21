class OrdersController < ApplicationController
 before_action :authenticate_user, :only => [:show, :update, :thank_you]
 
 def show
  @order = Order.find(params[:id])
 end
 
 def thank_you
 end
 
 def index
  @orders = current_user.checked_out_orders
 end
 
 private
 def order_params
  params.require(:order).permit(:user_id)
 end
end
