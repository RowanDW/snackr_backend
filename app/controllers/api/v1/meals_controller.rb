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

  def create
    user = User.find(params[:id])
    meal_name = params[:data][:attributes][:name]
    meal_time = params[:data][:attributes][:meal_time]
    meal = user.meals.new(name: meal_name, meal_time: meal_time)
    if meal.save
      # good job
      meal.add_foods(params[:data][:attributes][:foods])
    else
      #error
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
