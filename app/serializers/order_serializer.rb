class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :created_at, :line_items, :products

end
