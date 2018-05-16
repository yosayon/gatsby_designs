class LineItemsController < ApplicationController
 
 def create
  @product = Product.find_by_id(params[:product_id])
  if current_order.product_ids.include?(@product.id)
   line_item = LineItem.find_by(:order_id => current_order.id, :product_id => @product.id)
   line_item.add_quantity
  else
   line_item = LineItem.create(:product_id => @product.id, :cart_id => current_cart.id, :order_id => current_order.id, :quantity => 1)
  end
  redirect_to user_cart_path(current_user, current_cart)
 end
 
 def update
  @line_item = LineItem.find_by_id(params[:id])
  @line_item.subtract_quantity
  if @line_item.quantity == 0
   current_cart.line_items.destroy(@line_item)
  end
  redirect_to user_cart_path(current_user, current_cart)
 end
 
 def destroy
  product = Product.find_by_id(params[:product_id])
  line_item = LineItem.find(params[:id])
  product.line_items.destroy(line_item)
  redirect_to user_cart_path(current_user, current_cart)
 end
 
 private
 
 def line_item_params
  params.require(:line_item).permit(:product_id, :cart_id, :quantity)
 end
end
