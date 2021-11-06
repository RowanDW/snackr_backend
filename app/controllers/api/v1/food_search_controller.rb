class Api::V1::FoodSearchController < ApplicationController
  def index
    if params[:food_search]
      foods = FoodFacade.find_foods(params[:food_search])
      render json: FoodSerializer.new(foods), status: 200
    else
      render json: {error: "bad request"}, status: 400
    end
  end
end
