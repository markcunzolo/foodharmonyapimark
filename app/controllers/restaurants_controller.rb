class RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(new_restaurant_params)
    if params[:restaurant][:types].present?
      params[:restaurant][:types].each do |t|
        @restaurant.types << Type.find(t)
      end
    end
    if params[:restaurant][:genres].present?
      params[:restaurant][:genres].each do |g|
        @restaurant.genres << Genre.find(g)
      end
    end
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
