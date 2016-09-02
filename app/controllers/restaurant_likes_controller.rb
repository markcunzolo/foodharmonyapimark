class RestaurantLikesController < ApplicationController

  def create
    @existing_like = RestaurantLike.where(:restaurant_id => new_restaurant_like_params[:restaurant_id]).where(:user_id => new_restaurant_like_params[:user_id]).first
    if @existing_like.present?
      RestaurantLike.where(:restaurant_id => new_restaurant_like_params[:restaurant_id]).where(:user_id => new_restaurant_like_params[:user_id]).update_all(:liked => new_restaurant_like_params[:liked], :disliked => new_restaurant_like_params[:disliked])
    else
      @restaurant_like = RestaurantLike.new(new_restaurant_like_params)
      @restaurant_like.save!
    end

    render json: Restaurant.all.as_json(:include => [:types, :genres, :restaurant_likes])
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
