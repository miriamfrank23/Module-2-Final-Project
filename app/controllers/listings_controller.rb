class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def find_listing
    @listing = Listing.find_by(id: params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :user_id, :price)
  end

end
