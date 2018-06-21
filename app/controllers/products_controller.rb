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
  @reviews = Review.where(:product_id => @product.id ).paginate(:page => params[:page], :per_page => 5)
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
