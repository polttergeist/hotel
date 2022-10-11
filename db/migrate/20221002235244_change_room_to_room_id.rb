# frozen_string_literal: true

class ChangeRoomToRoomId < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :room_id
  end
end
