class ProductsController < ApplicationController
 
 def index
  @products = Product.all
 end
 
 def show
  @product = Product.find_by_id(params[:id])
 end
 
 def highest_rated
  @products = Product.by_highest_rating
  render :index
 end
 
end
