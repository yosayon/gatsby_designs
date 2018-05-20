class LineItem < ApplicationRecord
 belongs_to :product
 belongs_to :cart
 belongs_to :order
 
 def add_quantity
  self.update(:quantity => self.quantity + 1)
 end
 
 def subtract_quantity
  self.update(:quantity => self.quantity - 1)
 end
 
end
