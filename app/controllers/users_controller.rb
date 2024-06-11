class UsersController < ApplicationController

  def show
    @user = current_user
    @brains = Brain.where(user_id: current_user.id)
  end
end
