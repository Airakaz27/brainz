class BrainsController < ApplicationController
  before_action :set_brain, only: [:show, :edit, :update, :destroy]

  def index
    @brains = Brain.all
  end

  def show
    @user = current_user
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

  def edit
  end

  def update
    @brain.update(brain_params)
    redirect_to brain_path(@brain)
  end

  def destroy
    @brain.destroy
    redirect_to user_path(current_user.id), status: :see_other
  end

  private

  def brain_params
    params.require(:brain).permit(:photo, :name, :qi, :languages, :specialties, :price_per_day)
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end
end
