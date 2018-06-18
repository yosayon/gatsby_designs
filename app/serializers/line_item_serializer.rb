class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product_id
  belongs_to :product
  belongs_to :order
  belongs_to :line_item
end
