class Api::V1::FoodEntriesController < ApplicationController

  def index
    user = User.find_by(id: params[:id])
    foods = FoodEntry.foods_with_rank(user)
  end
end
