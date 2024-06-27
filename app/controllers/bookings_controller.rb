class BookingsController < ApplicationController
  def new
    @booking = Booking.new # Needed to instantiate the form_with
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :address, :rating)
  end
end
