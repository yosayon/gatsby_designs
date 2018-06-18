class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :created_at

  has_many :products, :through => :line_items

end
