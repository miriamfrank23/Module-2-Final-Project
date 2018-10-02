class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

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
    @listing = Listing.new
    @states = [
		"AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC",
    "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA",
    "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE",
    "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC",
    "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]
  end

  def create
    @user = User.find_by(id: session[:user_id])
    byebug
    @listing = Listing.create(listing_params)
    @listing.user_id = @user.id
    if @listing.valid?
      @listing.state = params[:state]
      @listing.save
      redirect_to @listing
    else
      flash[:error] = @listing.errors.full_messages
      redirect_to new_listing_path
    end
  end

  def edit
    @states = [
		"AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC",
    "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA",
    "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE",
    "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC",
    "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]
  end

  def update
    @listing.update(listing_params)
    if @listing.valid?
      redirect_to @listing
    else
      flash[:error] = @listing.errors.full_messages
      redirect_to edit_listing_path
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def find_listing
    @listing = Listing.find_by(id: params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :user_id, :price, :image, :state, :city, :address)
  end

end
