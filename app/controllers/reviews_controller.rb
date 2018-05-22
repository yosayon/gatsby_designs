class ReviewsController < ApplicationController
 before_action :find_review, :only => [:show, :edit, :update, :destroy]
 
 def new
  @review = Review.new
 end
 
 def index
  @reviews = Review.all
 end
 
 def show
 end
 
 def edit
 end
 
 def update
 end
 
 def destroy
  @user = User.find_by_id(params[:user_id])
  @user.reviews.find_by(:params[:id])
  
 end
 
 private
 
 def review_params
  params.require(:review).permit(:title, :comment, :user_id, :product_id, :product_rating)
 end
 
 def find_review
  @review = Review.find(params[:id])
 end
 
end
