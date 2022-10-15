# frozen_string_literal: true

class Review < ApplicationRecord
  after_update :enqueue
  after_initialize { self.approved = false }

  validates :name, presence: true, length: { maximum: 70 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :comment, :approved, presence: true

  scope :approved_reviews, -> { Review.where(approved: true) }
  scope :all_ordered_by_date, -> { Review.all.order(created_at: :desc) }

  def enqueue
    ApproveMailer.with(email:, type: 'review').approve_mail.deliver_later if approved == 1
  end
end
