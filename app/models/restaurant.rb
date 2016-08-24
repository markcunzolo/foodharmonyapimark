class Restaurant < ActiveRecord::Base
  has_many :restaurant_genres
  has_many :genres, through: :restaurant_genres
  has_many :restaurant_types
  has_many :types, through: :restaurant_types
  has_many :restaurant_likes
end
