class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :user_id, :product_id
end
