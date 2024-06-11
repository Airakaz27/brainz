class BrainsController < ApplicationController
  before_action :set_brain

  def index
    @brains = Brain.all
  end

  def show
    @brain = Brain.find(params[:id])
  end

  private

  def set_brain
    @brain = Brain.find(params[:id])
  end
end
