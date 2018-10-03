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
    @review = Review.new(review_params)
    if @review.valid?
      redirect_to @review
    else
      flash[:error] = @review.errors.full_messages
      redirect_to new_review_path
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @review.destroy
  end

private

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :description, :user_id, :listing_id)
  end

end
