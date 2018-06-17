 class ProductSerializer < ActiveModel::Serializer
   attributes :id, :name, :picture, :price, :reviews
 end
