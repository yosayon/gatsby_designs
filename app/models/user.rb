class User < ApplicationRecord
 has_many :orders
 has_many :reviews
 has_secure_password
end
