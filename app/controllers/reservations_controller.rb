class ReservationsController < ApplicationController

 def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

 def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing_id = params[:listing_id]
    if @reservation.save
      redirect_to user_listings_path(current_user.id)
    else
      render :new
    end
  end
  

private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end 
end
