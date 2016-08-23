class CreateRestaurantsGenres < ActiveRecord::Migration
  def change
    create_table :restaurants_genres, :id => false do |t|
      t.references :restaurant
      t.references :genre
    end
    add_index :restaurants_genres, [:restaurant_id, :genre_id]
    add_index :restaurants_genres, :genre_id
  end
end
