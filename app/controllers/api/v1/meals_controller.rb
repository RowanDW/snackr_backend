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
    if User.exists?(params[:id])
      user = User.find(params[:id])
      meal = user.meals.new(meal_params)
      if meal.save
        meal.add_foods(foods_params)
        render json: MealSerializer.one_full_meal(meal), status: 200
      else
        # not sure how we would get here.
        render json: {error: "can't create meal"}, status: 400
      end
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

  private

  def meal_params
    {
      name: params[:data][:attributes][:name],
      meal_time: params[:data][:attributes][:meal_time]
    }
  end

  def foods_params
    params[:data][:attributes][:foods].map do |food|
      {
        food_name: food[:name],
        food_id:   food[:food_id],
      }
    end
  end
end
