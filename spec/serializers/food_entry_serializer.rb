require 'rails_helper'

RSpec.describe 'food entry serializer' do
  it 'serializes food entry object into json' do
    user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
    meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
    meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
    meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 5, meal_time: "00:00:00")
    food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
    food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")

    foods = FoodEntry.foods_with_rank(user)
    foods_json = FoodEntrySerializer.new(foods)

    expect(foods_json).to be_a(Hash)
    expect(foods_json).to have_key(:data)
    expect(foods_json[:data]).to be_an(Array)
    expect(foods_json[:data].first).to be_a(Hash)
    expect(foods_json[:data].first).to have_key(:type)
    expect(foods_json[:data].first[:type]).to eq("food_entry")
    expect(foods_json[:data].first).to have_key(:attributes)
    expect(foods_json[:data].first[:attributes]).to have_key(:name)
    expect(foods_json[:data].first[:attributes]).to have_key(:average_rank)
  end
end
