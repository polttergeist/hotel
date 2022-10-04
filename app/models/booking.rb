class Booking < ApplicationRecord
  has_one :room

  validates :name, :email, :start_date, :end_date, :approved, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

  scope :all_ordered_by_date, -> { Booking.all.order(created_at: :desc) }
end
