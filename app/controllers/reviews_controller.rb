class ReviewsController < ApplicationController

  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = Review.new
    @ratings = [1,2,3,4,5]
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @review = Review.create(rating: review_params[:rating], description: review_params[:description], user_id: @user.id, listing_id: flash[:listing_id])
    if @review.valid?
      @listing = Listing.find_by(id: flash[:listing_id])
      redirect_to listing_path(@listing)
    else
      flash[:error] = @review.errors.full_messages
      redirect_to new_review_path
    end
  end

  def edit
    @ratings = [1,2,3,4,5]
  end

  def update
    @review.update(review_params)
    if @review.valid?
      redirect_to @review
    else
      flash[:error] = @review.errors.full_messages
      redirect_to edit_review_path
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

private

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :description, :user_id, :listing_id)
  end

end
