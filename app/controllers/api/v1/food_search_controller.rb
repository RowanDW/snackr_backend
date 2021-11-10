class Api::V1::FoodSearchController < ApplicationController
  def index
    if params[:query]
      foods = FoodFacade.find_foods(params[:query])
      render json: FoodSerializer.new(foods), status: :ok
    else
      render json: { error: 'bad request' }, status: :bad_request
    end
  end
end
