class Admin::BookingsController < ApplicationController
  before_action :set_admin
  before_action :set_booking, only: %i[ update destroy ]
  before_action :authenticate_user!

  def index
    @bookings = Booking.all_ordered_by_date.paginate(page: params[:page], per_page: 10)
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

  def set_admin
    @admin = true
  end
end
