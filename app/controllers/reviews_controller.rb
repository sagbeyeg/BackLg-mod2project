class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params_new)
    @review.user_id = @current_user.id if @current_user
    @review.save
    if @review.valid?
      redirect_to user_path(@review.user)
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to games_path
    end
  end

  def edit
    
  end

  def update
    @review.update(review_params_edit)
    if @review.valid?
      redirect_to user_path(@review.user)
    else 
      flash[:errors] = @review.errors.full_messages
      redirect_to edit_review_path(@review)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@review.user)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params_new
    params.permit(:game_id).merge(rating: 0, completion_status: "Want")
  end

  def review_params_edit
    params.require(:review).permit(:user_id, :game_id, :title, :description, :rating, :completion_status)
  end

end
