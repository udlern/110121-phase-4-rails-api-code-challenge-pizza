class CreateRestaurantPizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_pizzas do |t|
      t.references :pizza
      t.references :restaurant
      t.integer :price
      t.timestamps
    end
  end
end
