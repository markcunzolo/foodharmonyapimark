class RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all
  end

  def create
    puts params
    @restaurant = Restaurant.new(new_restaurant_params)
    @restaurant.save!
    render json: Restaurant.all
  end

  private
  def new_restaurant_params
    params.require(:restaurant).permit(
      :name,
      :contact_information,
      :cost
    )
  end
end
