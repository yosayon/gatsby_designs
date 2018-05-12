class Product < ApplicationRecord
 has_many :line_items
 
 def slugify
  name.downcase.strip.gsub(' ', '')
 end
end
