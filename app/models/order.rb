class Order < ApplicationRecord
 has_many :line_items
 
 def check_out_order
  self.update(:checkout => true)
 end
end
