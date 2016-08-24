class CreateRestaurantLikes < ActiveRecord::Migration
  def change
    create_table :restaurant_likes, :id => false do |t|
      t.references :restaurant
      t.references :user
      t.boolean :liked, :default => false
      t.boolean :disliked, :default => false
    end
    add_index :restaurant_likes, [:restaurant_id, :user_id]
    add_index :restaurant_likes, :user_id
  end
end
