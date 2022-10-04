class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: %i[ update destroy ]
  before_action :authenticate_administrator!

  def index
    @reviews = Review.all_ordered_by_date
  end

  def update
    @review.update(approved: true)
    redirect_to admin_reviews_path
    flash[:notice] = "Review was approved"
  end

  def destroy
    @review.destroy
    redirect_to admin_reviews_path
    flash[:notice] = "Review was deleted"
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
