class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :user_id, :product_id, :product_rating, :product, :created_at, :email, :average_rating
  belongs_to :product
  belongs_to :user
  
  def email
   object.user.email
  end
  
  def average_rating
   object.product.average_rating
  end

end
