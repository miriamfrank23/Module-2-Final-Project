class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :show, :update, :destroy]

  def show
    @confirmation_num = @booking
    @listing = Listing.find(@booking.listing_id)
    @price = @listing.price
    @listing_name = @listing.name
    @check_in = "#{eval(@booking.check_in_date)[2]}/#{eval(@booking.check_in_date)[3]}/#{eval(@booking.check_in_date)[1]} "
    @check_out = "#{eval(@booking.check_out_date)[2]}/#{eval(@booking.check_out_date)[3]}/#{eval(@booking.check_out_date)[1]} "

  end

  def new
    @booking = Booking.new(:listing_id => params[:listing_id])
    @user = User.find(session[:user_id])
    @listing = Listing.find(params[:listing_id])
    @listing_name = @listing.name
    @owner = User.find(@listing.user_id)

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = params[:user_id]
    @booking.matched_user_id = params[:matched_user_id]
    @listing = Listing.find(params[:listing_id])
    @listing_id = @listing.id
    @booking.listing_id = @listing_id

    if @booking.save
      redirect_to @booking
    else
      flash[:error]
      redirect_to new_booking_path
    end

  end



  def edit
  end

  def update
  end

  def destroy
  end

  private
    def find_booking
      @booking = Booking.find_by(id: params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :owner_id, :listing_id, :check_in_date, :check_out_date)
    end
end
