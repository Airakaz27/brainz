class UsersController < ApplicationController
  before_action :set_user

  def show
    @brains = Brain.where(user_id: current_user.id)
  end

  private
  def set_user
    @user = current_user
  end
end
