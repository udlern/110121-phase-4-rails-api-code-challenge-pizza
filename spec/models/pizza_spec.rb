require 'rails_helper'

RSpec.describe Pizza, type: :model do
  
  describe "relationships" do

    let(:pizza) { Pizza.create(name: "Cheese", ingredients: "Dough, Tomato Sauce, Cheese") }
    let(:restaurant) { Restaurant.create(name: "Sottocasa NYC", address: "298 Atlantic Ave, Brooklyn, NY 11201") }
  
    it 'can access the associated restaurant_pizzas' do
      restaurant_pizza = RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 10)
  
      expect(pizza.restaurant_pizzas).to include(restaurant_pizza)
    end
  
    it 'can access the associated restaurants' do
      RestaurantPizza.create(pizza_id: pizza.id, restaurant_id: restaurant.id, price: 10)
  
      expect(pizza.restaurants).to include(restaurant)
    end

  end

end
