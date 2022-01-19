require 'rails_helper'

RSpec.describe RestaurantPizza, type: :model do

  let(:restaurant) { Restaurant.create(name: "Sottocasa NYC", address: "298 Atlantic Ave, Brooklyn, NY 11201") }
  let(:pizza) { Pizza.create(name: "Cheese", ingredients: "Dough, Tomato Sauce, Cheese") }

  describe "relationships" do

    it 'can access the associated restaurant' do
      restaurant_pizza = RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 10)

      expect(restaurant_pizza.restaurant).to eq(restaurant)
    end

    it 'can access the associated pizza' do
      restaurant_pizza = RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 10)

      expect(restaurant_pizza.pizza).to eq(pizza)
    end
  
  end

  describe "validations" do

    it "must have a price between 1 and 30" do
      expect(RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 10)).to be_valid
      expect(RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 0)).to be_invalid
      expect(RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 31)).to be_invalid
      expect(RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id)).to be_invalid
    end

  end

end
