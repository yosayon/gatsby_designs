 class ProductSerializer < ActiveModel::Serializer
   attributes :id, :name, :picture, :price, :average_rating, :reviews
   has_many :reviews
   has_many :line_items
   has_many :orders, :through => :line_items
 end
