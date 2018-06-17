 class ProductSerializer < ActiveModel::Serializer
   attributes :id, :name, :picture, :price
   has_many :reviews
 end
