class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @brains = Brain.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to destroy_user_session_path(@user), status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :pseudo, :email)
  end

  def set_user
    @user = current_user
  end
end
