class ReviewsController < ApplicationController
 before_action :find_review, :only => [:show, :edit, :update, :destroy]
 before_action :require_login
 
 
 def new
   @product = Product.find(params[:product_id])
   @review = @product.reviews.build
  render :layout => false
 end
 
 def create
  @review = current_user.reviews.create(review_params)
   if @review.save
    respond_to do |f|
     f.json {render :json => @review, :status => 201}
     f.html
    end
   else
    respond_to do |f|
     f.json { render :json => { :error => @review.errors, :text => @review}, :status => 422 }
     f.html
   end
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
  respond_to do |f|
   f.html
   f.json {render :json => @review}
  end
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
