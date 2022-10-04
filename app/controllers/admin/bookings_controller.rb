class Admin::BookingsController < ApplicationController
  before_action :set_booking, only: %i[ update destroy ]
  before_action :authenticate_administrator!

  def index
    @bookings = Booking.all_ordered_by_date
  end

  def update
    @booking.update(approved: true)
    redirect_to admin_bookings_path
    flash[:notice] = "Booking was approved"
  end

  def destroy
    @booking.destroy
    redirect_to admin_bookings_path
    flash[:notice] = "Booking was deleted"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
