class RestaurantLikesController < ApplicationController

  def create
    @restaurant_like = RestaurantLike.new(new_restaurant_like_params)
    @restaurant_like.save!
    render json: true
  end

  private
  def new_restaurant_like_params
    params.require(:restaurant_like).permit(
        :restaurant_id,
        :user_id,
        :liked,
        :disliked
    )
  end
end
