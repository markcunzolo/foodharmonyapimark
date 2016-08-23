class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address
      t.string :zip_code
      t.string :web_site
      t.string :phone_number
      t.string :cost

      t.timestamps null: false
    end
  end
end
