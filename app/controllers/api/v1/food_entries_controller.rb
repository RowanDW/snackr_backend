class Api::V1::FoodEntriesController < ApplicationController

  def index
    user = User.find_by(id: params[:id])
    if user && params[:method] == "top_10"
      foods = FoodEntry.ten_highest_ranked(user)
      render json: FoodEntrySerializer.new(foods), status: 200
    elsif user && params[:method] == "bottom_10"
      foods = FoodEntry.ten_lowest_ranked(user)
      render json: FoodEntrySerializer.new(foods), status: 200
    elsif user && params[:method].nil?
      foods = FoodEntry.foods_with_rank(user)
      render json: FoodEntrySerializer.new(foods), status: 200
    else
      render json: {error: "bad request"}, status: 400
    end
  end

end
