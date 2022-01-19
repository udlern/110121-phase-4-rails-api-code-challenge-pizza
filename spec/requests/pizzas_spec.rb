require 'rails_helper'

RSpec.describe "Pizzas", type: :request do
  before do
    Pizza.create(name: "Cheese", ingredients: "Dough, Tomato Sauce, Cheese")
    Pizza.create(name: "Pepperoni", ingredients: "Dough, Tomato Sauce, Cheese, Pepperoni")
  end

  describe "GET /pizzas" do
    it 'returns an array of all pizzas' do
      get '/pizzas'

      expect(response.body).to include_json([
        {
          id: a_kind_of(Integer),
          name: "Cheese",
          ingredients: "Dough, Tomato Sauce, Cheese"
        },
        {
          id: a_kind_of(Integer),
          name: "Pepperoni",
          ingredients: "Dough, Tomato Sauce, Cheese, Pepperoni"
        }
      ])
    end

    it 'returns a status of 200 (OK)' do
      get '/pizzas'
      expect(response).to have_http_status(:ok)
    end
  end

end
