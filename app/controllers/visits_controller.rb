class VisitsController < ApplicationController

  respond_to :json

  before_filter :sign_in_required

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    visit = current_lunch.visits.for_user(current_user).first
    if visit.present?
      visit.update_attributes(:restaurant => restaurant)
    else
      visit = current_lunch.visits.create(:user => current_user, :restaurant => restaurant)
    end

    respond_with visit, :location => lunch_url(current_lunch)
  end

  private

  def current_lunch
    @_current_lunch = Lunch.find params[:lunch_id]
  end

end