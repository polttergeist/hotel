class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.text :name
      t.text :email
      t.datetime :start_date
      t.datetime :end_date
      t.text :comment

      t.timestamps
    end
  end
end
