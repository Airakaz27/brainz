class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @brains = Brain.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :pseudo, :email)
  end

  def set_user
    @user = current_user
  end
end
