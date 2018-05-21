class Cart < ApplicationRecord
 has_many :line_items
 has_many :products, :through => :line_items
 belongs_to :user
 
 def total
  prices = []
  self.line_items.each{|line_item| prices << line_item.product.price * line_item.quantity}
  @total = (prices.reduce(:+))
  if @total.nil?
   @total = 0
  else
   @total.floor
  end
 end
 
 def merge_cart_items_with(temp_user)
  if self.line_items.empty?
   temp_user.cart.line_items.each{|line_item| line_item.update(:order_id => self.user.current_order.id, :cart_id => self.id)}
  else
   temp_user.cart.product_ids.each do |id|
    if self.product_ids.include?(id)
    line_item = LineItem.find_by(:cart_id => self.id, :product_id => id, :order_id => self.user.current_order)
    line_item.add_quantity
    else
    line_item = LineItem.find_by(:cart_id => temp_user.cart.id, :product_id => id, :order_id => temp_user.current_order.id)
    line_item.update(:order_id => self.user.current_order.id, :cart_id => self.id)
    self.line_items << line_item
    end
   end
  end
 end

end
