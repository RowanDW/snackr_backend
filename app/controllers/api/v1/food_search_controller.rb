class Api::V1::FoodSearchController < ApplicationController
  def index
    foods = FoodFacade.find_foods(params[:food_search])
    render json: FoodSerializer.new(foods), status: 200
  end
end
