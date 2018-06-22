class ProductsController < ApplicationController
 
 def index
  @products = Product.all
  respond_to do |f|
   f.html
   f.json {render :json => @products}  
  end
 end
 
 
 def show
  @product = Product.find_by_id(params[:id])
  respond_to do |f|
   f.json {render :json => @product}
   f.html
  end
 end
 
 def highest_rated
  @products = Product.by_highest_rating
  render :index
 end

end
