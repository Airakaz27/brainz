class ReviewsController < ApplicationController
  before_action :set_brain, only: [:new, :create]

  def new
    @review = Review.new(brain_id: @brain.id)
  end

  def create
    if current_user
      @review = Review.new(review_params)
      @review.brain_id = @brain.id
      if @review.save
        redirect_to brain_path(@brain)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_brain
    @brain = Brain.find(params[:brain_id])
  end
end
