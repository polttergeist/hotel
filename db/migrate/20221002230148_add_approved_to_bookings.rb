# frozen_string_literal: true

class AddApprovedToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :approved, :integer
  end
end
