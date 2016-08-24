class Genre < ActiveRecord::Base
  has_many :restaurant_genres, :class_name => 'RestaurantGenres'
  has_many :restaurants, through: :restaurant_genres
end
