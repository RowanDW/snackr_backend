class Api::V1::FoodEntriesController < ApplicationController

  def index
    user = User.find_by(id: params[:id])
    if user
      foods = FoodEntry.foods_with_rank(user)
      require 'pry'; binding.pry
      render json: FoodEntrySerializer.new(foods), status: 200
    else
      render json: {error: "bad request"}, status: 400
    end
  end
end
