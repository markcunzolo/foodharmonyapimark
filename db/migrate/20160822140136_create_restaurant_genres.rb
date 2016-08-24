class CreateRestaurantGenres < ActiveRecord::Migration
  def change
    create_table :restaurant_genres, :id => false do |t|
      t.references :restaurant
      t.references :genre
    end
    add_index :restaurant_genres, [:restaurant_id, :genre_id]
    add_index :restaurant_genres, :genre_id
  end
end
