class ProductsController < ApplicationController
 
 def index
  @products = Product.all
 end
 
 def show
  @product = Product.find_by_id(params[:id])
  respond_to do |f|
   f.html
   f.json {render :json => @product}
  end
 end
 
 def highest_rated
  @products = Product.by_highest_rating
  render :index
 end

end
