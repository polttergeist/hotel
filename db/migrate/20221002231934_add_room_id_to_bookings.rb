# frozen_string_literal: true

class AddRoomIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :room
  end
end
