class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, status: :ok, serializer: RestaurantPizzasSerializer
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head :no_content
    end

    private

    def render_not_found_response
        render json: {error: "Restaurant not found"}, status: :not_found
    end

end
