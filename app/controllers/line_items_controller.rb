class LineItemsController < ApplicationController
 
 def create
  line_item = LineItem.create(:product_id => params[:product_id], :cart_id => current_cart.id, :order_id => current_order.id)
  redirect_to user_cart_path(current_user, current_cart)
 end
 
 private
 
 def line_item_params
  params.require(:line_item).permit(:product_id, :cart_id, :quantity)
 end
 
end
