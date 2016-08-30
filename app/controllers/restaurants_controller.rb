class RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all.as_json(:include => [:types, :genres, :restaurant_likes])
  end

  def create
    @restaurant = Restaurant.new(new_restaurant_params)
    if params[:restaurant][:types].present?
      params[:restaurant][:types].each do |t|
        @restaurant.types << Type.find(t)
        @restaurant.types << Type.find(t)
      end
    end
    if params[:restaurant][:genres].present?
      params[:restaurant][:genres].each do |g|
        @restaurant.genres << Genre.find(g)
      end
    end
    @restaurant.save!
    render json: Restaurant.all.as_json(:include => [:types, :genres, :restaurant_likes])
  end

  private
  def new_restaurant_params
    params.require(:restaurant).permit(
      :name,
      :street_address,
      :cost,
      :web_site,
      :phone_number,
      :zip_code,
      :types => [:id],
      :genres => [:id]
    )
  end
end
