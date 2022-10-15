# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.text :name
      t.integer :cost

      t.timestamps
    end
  end
end
