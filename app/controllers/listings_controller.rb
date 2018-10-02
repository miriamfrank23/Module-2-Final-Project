class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    if params[:state]
      if params[:state].length != 2
       flash[:notice] = "Please enter a state abbreviation! (NY, NJ, CA)"
       redirect_to listings_path

      else
       @listings = Listing.all.select do |listing|
         listing[:state].downcase == params[:state].downcase
        end

         if @listings.length > 0
           
            @listings
         else
           flash[:notice] = "No Matches in That State"
           redirect_to listings_path
         end
       end
   else
     @listings = Listing.all.uniq
   end
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
    params.require(:listing).permit(:name, :user_id, :price, :state)
  end

end
