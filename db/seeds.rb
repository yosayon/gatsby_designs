# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
 {:name => "Broken Joe", :price => 184},
 {:name => "Dave", :price => 120},
 {:name => "Andrea", :price => 120},
 {:name => "Scotty", :price => 155},
 {:name => "Common", :price => 290},
 {:name => "Be Frank", :price => 310},
 {:name => "Asinine", :price => 230},
 {:name => "Corrupt", :price => 135},
 {:name => "Bleak", :price => 330},
 {:name => "Lust", :price => 285},
 {:name => "Hand Me Downs", :price => 990},
 {:name => "Obvious", :price => 138},
 {:name => "Mental", :price => 225},
 {:name => "Question", :price => 312},
 {:name => "Karma", :price => 549}
 ]
 
 products.each do |product|
  Product.create(product)
 end
