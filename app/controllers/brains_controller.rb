class BrainsController < ApplicationController
  before_action :set_brain, only: [:show, :edit, :update, :destroy]

  def index
    @brains = Brain.all
  end

  def show
    @user = current_user
    @booking = Booking.new
    @price = @brain.price_per_day
    @bookings = Booking.where(brain_id: @brain.id)
    @dates_booking = @bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }.to_json
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
    @user = current_user
    @brain.destroy
    redirect_to user_path(@user.id), status: :see_other
  end

  private

  def brain_params
    params.require(:brain).permit(:photo, :name, :qi, :price_per_day, languages: [], specialties: [])
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end
end
