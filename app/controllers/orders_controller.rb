class OrdersController < ApplicationController
 
 def show
  @order = Order.find(params[:id])
 end
 
 def thank_you
 end
 
 def index
  @orders = current_user.orders
 end
 
 private
 def order_params
  params.require(:order).permit(:user_id)
 end
end
