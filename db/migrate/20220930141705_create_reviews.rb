# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :name
      t.text :email
      t.text :comment
      t.integer :approved

      t.timestamps
    end
  end
end
