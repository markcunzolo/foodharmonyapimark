class CreateRestaurantsTypes < ActiveRecord::Migration
  def change
    create_table :restaurants_types, :id => false do |t|
      t.references :restaurant
      t.references :type
    end
    add_index :restaurants_types, [:restaurant_id, :type_id]
    add_index :restaurants_types, :type_id
  end
end
