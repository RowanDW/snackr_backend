class Api::V1::MealsController < ApplicationController
  def meals
    if User.exists?(params[:id])
      user = User.find(params[:id])
      meals = user.get_meals(params[:date])
      render json: MealSerializer.get_meals(meals), status: 200
    else
      render json: {error: "not found"}, status: 404
    end
  end

  def update
    if Meal.exists?(params[:meal_id])
      meal = Meal.find(params[:meal_id])
      meal.update(rank: params[:rank])
      render json: MealSerializer.one_meal(meal), status: 200
    else
      render json: {error: "not found"}, status: 404
    end
  end
end
