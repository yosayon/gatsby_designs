# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
 {:name => "Broken Joe", :price => 184, :picture => "/products/brokenjoe.jpg"},
 {:name => "Dave", :price => 120, :picture => "/products/dave.jpg"},
 {:name => "Andrea", :price => 120, :picture => "/products/andrea.jpg"},
 {:name => "Scotty", :price => 155, :picture => "/products/scotty.jpg"},
 {:name => "Common", :price => 290, :picture => "/products/common.jpg"},
 {:name => "Be Frank", :price => 310, :picture => "/products/befrank.jpg"},
 {:name => "Asinine", :price => 230, :picture => "/products/asinine.jpg"},
 {:name => "Corrupt", :price => 135, :picture => "/products/corrupt.jpg"},
 {:name => "Bleak", :price => 330, :picture => "/products/bleak.jpg"},
 {:name => "Lust", :price => 285, :picture => "/products/lust.jpg"},
 {:name => "Hand Me Downs", :price => 990, :picture => "/products/handmedowns.jpg"},
 {:name => "Obvious", :price => 138, :picture => "/products/obvious.jpg"},
 {:name => "Mental", :price => 225, :picture => "/products/mental.jpg"},
 {:name => "Question", :price => 312, :picture => "/products/question.jpg"},
 {:name => "Karma", :price => 549, :picture => "/products/karma.jpg"}
 ]
 
 products.each do |product|
  Product.create(product)
 end
