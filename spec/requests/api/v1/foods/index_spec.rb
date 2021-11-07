require 'rails_helper'

RSpec.describe "food index endpoint" do
  it 'returns foods from search if a food search param is given' do
    user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
    meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
    meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
    meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 5, meal_time: "00:00:00")
    food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
    food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")

    get "/api/v1/users/#{user.id}/foods"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    foods = JSON.parse(response.body, symbolize_names: true)
  end
end
