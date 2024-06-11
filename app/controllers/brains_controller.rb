class BrainsController < ApplicationController
  # before_action :set_brain

  def index
    @brains = Brain.all
  end

  def show
    @brain = Brain.find(params[:id])
  end

  def new
    @brain = Brain.new
  end

  def create
    @brain = Brain.new(brain_params)
    @brain.user_id = current_user.id
    if @brain.save
      redirect_to brain_path(@brain)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # private

  def brain_params
    params.require(:brain).permit(:photo, :name, :qi, :languages, :specialties, :price_per_day)
  end

  # def set_brain
  #   @brain = Brain.find(params[:id])
  # end
end
