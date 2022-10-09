class ReviewsController < ApplicationController
  def index
    @reviews = Review.approved_reviews.paginate(page: params[:page], per_page: 10)
  end

  def create
    @review = Review.new(review_params)
    @review.approved = false
    if @review.save
      flash[:success] = "Review was successfully created"
      redirect_to reviews_path
    else
      @reviews = Review.approved_reviews.paginate(page: params[:page], per_page: 10)
      render "index"
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :comment)
  end
end
