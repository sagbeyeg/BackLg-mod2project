class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id if current_user 
    if @review.valid
      # redirect_to #user_path(@review.user)
    else
      flash[:error] = "Please try again, information is incomplete"
      redirect_to 'new'
    end
  end

  def edit
  end

  def update
    @review.user_id = current_user if current_user
    if @review.update(review_params)
      # redirect_to 
    else 
      flash[:error] = "Please try again, something went wrong"
      redirect_to edit_review_path(@review)
    end
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:game_id, :rating, :description, :title)
  end
end
