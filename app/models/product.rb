class Product < ApplicationRecord
 has_many :line_items
 has_many :orders, :through => :line_items
 has_many :reviews
 scope :has_a_review, -> {where('id IN (SELECT DISTINCT(product_id) FROM reviews)')}

 def average_rating
  self.reviews.empty? ? 0 : reviews.average(:product_rating)
 end
 
 def self.by_highest_rating
  all.sort_by{|product| - product.average_rating}
 end
 
 def self.by_price
  all.sort_by{|product| product.price}
 end

end
