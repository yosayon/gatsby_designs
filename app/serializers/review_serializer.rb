class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :user_id, :product_id, :created_at, :product, :user
end
