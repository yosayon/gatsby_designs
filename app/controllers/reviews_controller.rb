class ReviewsController < ApplicationController
 before_action :find_review, :only => [:show, :edit, :update, :destroy]
 before_action :require_login
 before_action :authenticate_user
 
 
 def new
  session[:product_id] = Product.find(params[:product_id]).id
  @review = @product.reviews.build
 end
 
 def create
  if Product.find_by_id(params[:product_id]) != current_product
   render :file => "#{Rails.root}/public/422.html", :layout => false
  else
   @review = Review.new(:title => params[:title], :comment => params[:comment], :product_rating => params[:product_rating], :user_id => current_user.id, :product_id => current_product)
   if @review.save
    redirect_to @review.product
   else
    @review = current_product.reviews.build
    render :new
   end
  end
 end
 
 def index
  if params[:product_id]
   @reviews = Product.find(params[:product_id]).reviews
  elsif params[:user_id]
   @reviews = User.find(params[:user_id]).reviews
  else
   @reviews = Review.all
  end
 end
 
 def show
 end
 
 def edit
 end
 
 def update
  if @review.update(review_params)
   redirect_to user_review_path(@review.user, @review)
  else
   render :edit
  end
 end
 
 def destroy
  @user = User.find(params[:user_id])
  @user.reviews.destroy(@review)
  redirect_to user_reviews_path(@user)
 end
 
 private
 
 def review_params
  params.require(:review).permit(:title, :comment, :user_id, :product_id, :product_rating)
 end
 
 def find_review
  @review = Review.find(params[:id])
 end

end
