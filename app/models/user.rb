class User < ApplicationRecord
 has_secure_password
 has_many :orders
 has_many :reviews
 
 def self.find_or_create_by_omniauth(auth)
  where(:email => auth.info.email).first_or_create do |user|
   user.id = auth.info.uid
   user.name = auth.info.name
   user.password = SecureRandom.hex
   end
  end
end
