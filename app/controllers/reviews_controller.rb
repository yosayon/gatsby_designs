class ReviewsController < ApplicationController
 before_action :find_review, :only => [:show, :edit, :update, :destroy]
 before_action :require_login
 
 
 def new
  @product = Product.find(params[:product_id])
  @review = @product.reviews.build
 end
 
 def create
  @review = current_user.reviews.create(review_params)
   if @review.save
    redirect_to @review.product
   else
    render :new
   end
 end
 
 def index
  if params[:product_id]
   @reviews = Product.find(params[:product_id]).reviews
  elsif params[:user_id]
   reviews = User.find(params[:user_id]).reviews
   render json: reviews
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
