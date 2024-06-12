class BookingsController < ApplicationController
  before_action :set_brain, only: [:show, :new, :create, :destroy]
  before_action :set_user, only: [:show, :new, :create]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # rajouter un if pour vérifier que le user est connecté sinon le renvoyer vers la page de cnnexion
    @booking.user_id = @user.id
    @booking.brain_id = @brain.id
    # calculate total price
    @booking.total_price = @brain.price_per_day * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      redirect_to brain_booking_path(@brain.id, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.brain_id = @brain.id
    @booking.destroy
    redirect_to user_path(current_user.id), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_brain
    @brain = Brain.find(params[:brain_id])
  end

  def set_user
    @user = current_user
  end

end
