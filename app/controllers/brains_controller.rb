class BrainsController < ApplicationController
  before_action :set_brain, only: [:show, :edit, :update, :destroy]

  def index
    @brains = Brain.all
    filter_brains if params[:filter].present?
  end

  def show
    @reviews = Review.where(brain_id: @brain.id)
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

  def filter_brains
    if params[:filter][:qi].present?
      @brains = @brains.where("qi >= ?", params[:filter][:qi])
    end

    if params[:filter][:languages].present?
      selected_languages = params[:filter][:languages].reject(&:blank?)
      @brains = @brains.select { |brain| (brain.languages & selected_languages).present? }
    end

    if params[:filter][:specialties].present?
      selected_specialties = params[:filter][:specialties].reject(&:blank?)
      @brains = @brains.select { |brain| (brain.specialties & selected_specialties).present? }
    end

    if params[:filter][:price_per_day].present?
      @brains = @brains.where("price_per_day <= ?", params[:filter][:price_per_day])
    end
  end

  def brain_params
    params.require(:brain).permit(:photo, :name, :qi, :price_per_day, languages: [], specialties: [])
  end

  def set_brain
    @brain = Brain.find(params[:id])
  end
end
