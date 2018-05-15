class CartsController < ApplicationController
 
 def show
 end
 
 def update
  @user = User.find(params[:user_id])
  @user.check_out_order
  current_order.check_out_order
  redirect_to order_complete_path
 end
 
 
 def destroy
 end
 
 private
 
 def cart_params
  params.require(:cart).permit(:user_id)
 end
end
