class Review < ApplicationRecord
 belongs_to :user
 belongs_to :product
 validates :title, :comment, :product_rating, :user_id, :product_id, :presence => true
 validates :comment, :length => {:minimum => 3}
 validates :product_rating, :inclusion => {:in => [1,2,3,4,5]}
  
end
