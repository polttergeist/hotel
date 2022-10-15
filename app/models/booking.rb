# frozen_string_literal: true

class DateTimeValidator < ActiveModel::Validator
  def validate(booking)
    booking.errors.add :date_range, 'overlaps with another booking' if check_date(booking)
  end

  private

  def check_date(booking)
    booking_date_range = (booking.start_date..booking.end_date)
    n = booking.name
    i = booking.room_id
    room_bookings = Room.find(booking.room_id).bookings.where.not(id: booking.id)
    room_bookings.any? { |b| booking_date_range.overlaps?(b.start_date..b.end_date) }
  end
end

class Booking < ApplicationRecord
  include ActiveModel::Validations
  has_one :room
  attr_accessor :date_range

  after_update :enqueue
  after_initialize do
    @date_range = (start_date..end_date)
    self.approved = false
  end

  validates :name, :email, :start_date, :end_date, :approved, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates_with DateTimeValidator

  scope :all_ordered_by_date, -> { Booking.all.order(created_at: :desc) }
  scope :approved_bookings, -> { Booking.where(approved: true) }

  def enqueue
    if approved == 1
      GenerateBookingLogsJob.perform_later
      ApproveMailer.with(email:, type: 'booking').approve_mail.deliver_later
    end
  end
end
