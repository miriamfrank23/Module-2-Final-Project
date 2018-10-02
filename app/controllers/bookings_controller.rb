class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
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
      params.require(:booking).permit(:user_id, :owner_id, :listing_id ,:price)
    end
end
