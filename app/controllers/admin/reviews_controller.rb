class Admin::ReviewsController < ApplicationController
  before_action :set_admin
  before_action :set_review, only: %i[ update destroy ]
  before_action :authenticate_user!

  def index
    @reviews = Review.all_ordered_by_date.paginate(page: params[:page], per_page: 10)
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

  def set_admin
    @admin = true
  end
end
