require 'rails_helper'

RSpec.describe "RestaurantPizzas", type: :request do
  before do
    Restaurant.create(name: "Sottocasa NYC", address: "298 Atlantic Ave, Brooklyn, NY 11201")
    Pizza.create(name: "Cheese", ingredients: "Dough, Tomato Sauce, Cheese")
  end

  describe "POST /restaurant_pizzas" do
    
    context "with valid data" do
      let!(:restaurant_pizza_params) { { pizza_id: Pizza.first.id, restaurant_id: Restaurant.first.id, price: 10 } }

      it 'creates a new RestaurantPizza' do
        expect { post '/restaurant_pizzas', params: restaurant_pizza_params }.to change(RestaurantPizza, :count).by(1)
      end

      it 'returns the associated Pizza data' do
        post '/restaurant_pizzas', params: restaurant_pizza_params

        expect(response.body).to include_json({
          id: a_kind_of(Integer),
          name: "Cheese", 
          ingredients: "Dough, Tomato Sauce, Cheese"
        })
      end

      it 'returns a status code of 201 (created)' do
        post '/restaurant_pizzas', params: restaurant_pizza_params

        expect(response).to have_http_status(:created)
      end

    end

    context "with invalid data" do
      let!(:invalid_pizza_params) { { price: 1000, pizza_id: Pizza.first.id, restaurant_id: Restaurant.first.id } }

      it 'does not create a new RestaurantPizza' do
        expect { post '/restaurant_pizzas', params: invalid_pizza_params }.to change(RestaurantPizza, :count).by(0)
      end

      it 'returns the error messages' do
        post '/restaurant_pizzas', params: invalid_pizza_params

        expect(response.body).to include_json({
          errors: a_kind_of(Array)
        })
      end

      it 'returns a status code of 422 (Unprocessable Entity)' do
        post '/restaurant_pizzas', params: invalid_pizza_params
  
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

end
