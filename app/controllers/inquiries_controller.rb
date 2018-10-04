class InquiriesController < ApplicationController

  def new
    byebug
    @inquiry = Inquiry.new
    @listing = Listing.find(session[:listing_id])
    @user = User.find(session[:user_id])
    @listing_name = @listing.name
    @owner = User.find(@listing.user_id).name
  end

  def create
    @inquiry = Inquiry.create(inquiry_params)
    @inquiry.user_id = session[:user_id]
    @inquiry.listing_id = session[:listing_id]


    if @inquiry.valid?
      flash[:notice] = "We delivered your inquiry to the owner! Get back to exploring!"
      @listing = Listing.find(@inquiry.listing_id)
      redirect_to @listing
    else
    end
  end




  private

  def inquiry_params
    params.require(:inquiry).permit(:user_id, :listing_id, :content)
  end


end
