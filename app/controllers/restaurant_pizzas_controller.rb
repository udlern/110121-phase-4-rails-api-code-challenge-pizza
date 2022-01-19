class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def create
        restaurantPizza = RestaurantPizza.create!(restaurantPizza_params)
        render json: restaurantPizza.pizza, status: :created
    end

    private

    def restaurantPizza_params
        params.permit(:pizza_id, :restaurant_id, :price)
    end

    def render_unprocessable_entity_response(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
      end
end
