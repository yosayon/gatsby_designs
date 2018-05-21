class CartsController < ApplicationController
 before_action :require_login, :only => [:update]
 
 def show
 end
 
 def update
  @user = User.find(params[:user_id])
  if @user.cart.line_items.empty?
   flash[:message] = "Cart cannot be empty for checkout"
   render :show
  else
   @user.check_out_order
   current_order.check_out_order
   redirect_to order_complete_path
  end
 end

 private
 
 def cart_params
  params.require(:cart).permit(:user_id)
 end

 
end
