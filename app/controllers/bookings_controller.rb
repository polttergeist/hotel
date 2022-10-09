class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.approved = false
    @booking.save ? flash[:success] = "Room was successfully booked" : flash[:success] = "There was some error"
    redirect_to rooms_path
  end

  private

  def booking_params
    params.permit(:name, :email, :start_date, :end_date, :comment, :room_id)
  end
end
