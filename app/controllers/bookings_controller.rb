# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @room = Room.find(booking_params[:room_id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = 'Room was successfully booked'
      redirect_to rooms_path
    else
      @room = Room.find(@booking.room_id)
      render 'bookings/new'
    end
  end

  private

  def booking_params
    params.permit(:name, :email, :start_date, :end_date, :comment, :room_id)
  end
end
