class Room < ApplicationRecord
  has_many :bookings

  validates :name, :description, :cost, presence: true
end
