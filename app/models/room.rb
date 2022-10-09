class Room < ApplicationRecord
  has_many :bookings
  has_many_attached :images

  validates :name, :description, :cost, presence: true
end
