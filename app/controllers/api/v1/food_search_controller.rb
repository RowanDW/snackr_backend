class Api::V1::FoodSearchController < ApplicationController
  def index
    if params[:query]
      foods = FoodFacade.find_foods(params[:query])
      render json: FoodSerializer.new(foods), status: 200
    else
      render json: {error: "bad request"}, status: 400
    end
  end
end
