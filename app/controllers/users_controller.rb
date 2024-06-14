class UsersController < ApplicationController
  before_action :set_user

  def show
    @brains = Brain.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
    @received_bookings = []
    Brain.where(user: current_user).each { |brain| @received_bookings << brain.bookings }
    @received_bookings.flatten!
  end

  private

  def set_user
    @user = current_user
  end
end
