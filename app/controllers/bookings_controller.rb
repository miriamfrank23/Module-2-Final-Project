class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :show, :update, :destroy]

  def show
    byebug

    if params[:listing_id]
      @confirmation_num = @booking
      @listing = Listing.find(@booking.listing_id)
      @price = @listing.price
      @listing_name = @listing.name
      @check_in = "#{eval(@booking.check_in_date)[2]}/#{eval(@booking.check_in_date)[3]}/#{eval(@booking.check_in_date)[1]} "
      @check_out = "#{eval(@booking.check_out_date)[2]}/#{eval(@booking.check_out_date)[3]}/#{eval(@booking.check_out_date)[1]} "
    else
      @listing = Listing.find(session[:listing_id])
      @price = @listing.price
      @listing_name = @listing.name
      @check_in = session[:check_in_date]
      @check_out = session[:check_out_date]
      @confirmation_num = rand(192912312...123123123123)

    end


  end

  def new

    if params[:listing_id]

      @listing = Listing.find(params[:listing_id])
      @booking = Booking.new(:listing_id => params[:listing_id])
      @user = User.find(session[:user_id])
      @listing_name = @listing.name
      @owner = User.find(@listing.user_id)

    else

      @listing = Listing.find(session[:listing_id])
      @booking = Booking.new(:listing_id => session[:listing_id])
      @user = User.find(session[:user_id])
      @listing_name = @listing.name
      @owner = User.find(@listing.user_id)

    end
  end

  def create
    @year_in= booking_params[:"check_in_date(1i)"]
    @month_in= booking_params[:"check_in_date(2i)"]
    @day_in= booking_params[:"check_in_date(3i)"]
    @year_out= booking_params[:"check_out_date(1i)"]
    @month_out= booking_params[:"check_out_date(2i)"]
    @day_out= booking_params[:"check_out_date(3i)"]
    @check_in = @month_in + "/" + @day_in + "/" + @year_in
    @check_out = @month_out + "/" + @day_out + "/" + @year_out
    @booking = Booking.new
    @booking.user_id = params[:user_id]
    @booking.matched_user_id = params[:matched_user_id]
    @listing = Listing.find(params[:listing_id])
    @listing_id = @listing.id
    @booking.listing_id = @listing_id
    @booking.check_in_date = @check_in
    @booking.check_out_date = @check_out

    if @booking.valid?
      session[:listing_id] = @listing_id
      session[:booking_id] = @booking.id
      session[:matched_user_id] = @booking.matched_user_id
      session[:check_in_date] = @booking.check_in_date
      session[:check_out_date] = @booking.check_out_date
      redirect_to '/bookings/show', :listing_id => @listing_id, :user_id => session[:user_id], session[:booking_id] => @booking_id, session[:matched_user_id] => @booking.matched_user_id,    session[:check_in_date] => @booking.check_in_date, session[:check_out_date] => @booking.check_out_date
    else

      flash[:error] = @booking.errors.full_messages
      # store listing id in session
      session[:listing_id] = @listing_id

      redirect_to '/bookings/new', :listing_id => @listing_id
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
