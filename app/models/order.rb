class Order < ApplicationRecord
 has_many :line_items
 has_many :products, :through => :line_items
 
 
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
  
end
