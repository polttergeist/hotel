class Booking < ApplicationRecord
  has_one :room

  after_update :enqueue

  validates :name, :email, :start_date, :end_date, :approved, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

  scope :all_ordered_by_date, -> { Booking.all.order(created_at: :desc) }
  scope :approved_bookings, -> { Booking.where(approved: true) }

  def enqueue
    GenerateBookingLogsJob.perform_later if self.approved == 1
  end
end
