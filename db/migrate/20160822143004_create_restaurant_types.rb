class CreateRestaurantTypes < ActiveRecord::Migration
  def change
    create_table :restaurant_types, :id => false do |t|
      t.references :restaurant
      t.references :type
    end
    add_index :restaurant_types, [:restaurant_id, :type_id]
    add_index :restaurant_types, :type_id
  end
end
