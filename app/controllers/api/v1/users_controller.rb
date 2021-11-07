class Api::V1::UsersController < ApplicationController

  def login
    user = User.find_or_create_by(email: params[:email])
    if user.name.nil?
      user.name = params[:name]
    end
    user.access_token = params[:access_token]
    render json: UserSerializer.new(user), status: 200
  end

  def meals
    user = User.find(params[:id])
    meals = user.get_meals(params[:date])
    render json: MealSerializer.new(meals), status: 200
  end
end
