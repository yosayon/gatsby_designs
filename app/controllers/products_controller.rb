class ProductsController < ApplicationController
 before_action :get_current_url, :only => [:show]
 
 def index
  @products = Product.all
 end
 
 def show
  @product = Product.find_by_id(params[:id])
 end
 
 private
 
 def get_current_url
  current_url if !logged_in?
 end

end
