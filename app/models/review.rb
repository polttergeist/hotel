class Review < ApplicationRecord
  validates :name, presence: true, length: { maximum: 70 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :comment, presence: true
  validates :approved, presence: true

  scope :approved_reviews, -> { Review.where(approved: true) }
  scope :all_ordered_by_date, -> { Review.all.order(created_at: :desc) }
end
