class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :user_id, :product_id, :product_rating, :created_at
  belongs_to :product
  belongs_to :user
end
