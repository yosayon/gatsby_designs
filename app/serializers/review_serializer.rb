class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :user_id, :product_id, :product_rating, :created_at, :product, :user
  belongs_to :product
end
