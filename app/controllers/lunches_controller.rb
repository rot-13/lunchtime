class LunchesController < ApplicationController

  respond_to :json

  def show
    respond_with Lunch.find(params[:id])
  end

  def today
    respond_with Lunch.last
  end

end