class User < ApplicationRecord
 has_secure_password
 has_many :orders
 has_one :cart
 has_many :reviews
 validates :email, :presence => true, :uniqueness => true
 validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
 validates :password, :confirmation => true
 validates :password, length: 6..20
 
 
 def self.find_or_create_by_omniauth(auth)
  where(:email => auth.info.email).first_or_create do |user|
   user.id = auth.uid
   user.password = SecureRandom.hex(10)
  end
 end
  
  def current_cart
   if !self.cart
    self.create_cart
   else
    self.cart
   end
  end
   
  def current_order
   @current_order = self.orders.find{|order| order.checkout == false} 
   @current_order.nil? ? new_order : @current_order
  end
  
  def new_order
   @current_order = self.orders.create
  end
  
  def check_out_order
   self.cart.line_items.delete_all
  end

 def self.create_temporary_user
  User.create(:email => "temp_user#{SecureRandom.hex(5)}@lostgeneration.com", :password => SecureRandom.hex(10))
 end
 
 def checked_out_orders
  self.orders.all.where(:checkout => true)
 end
 
end
