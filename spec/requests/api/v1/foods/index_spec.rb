require 'rails_helper'

RSpec.describe "food index endpoint" do
  it 'returns foods for a given user it that user exists' do
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

    expect(foods).to be_a(Hash)
    expect(foods).to have_key(:data)
    expect(foods[:data]).to be_an(Array)
    expect(foods[:data].first).to have_key(:attributes)
    expect(foods[:data].first[:attributes][:name]).to eq("pop tart")
    expect(foods[:data].first[:attributes][:average_rank]).to eq("7.0")
  end

  it 'returns foods for a given user with a method param of top_10' do
    user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
    meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 10, meal_time: "00:00:00")
    meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 9, meal_time: "00:00:00")
    meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
    meal4 = Meal.create!(name: "Fourth meal", user_id: user.id, rank: 7, meal_time: "00:00:00")
    meal5 = Meal.create!(name: "Fifth meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
    food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
    food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")
    food_entry3 = FoodEntry.create!(meal_id: meal3.id, food_id: "def", food_name: "blueberry")
    food_entry4 = FoodEntry.create!(meal_id: meal4.id, food_id: "hij", food_name: "strawberry")
    food_entry5 = FoodEntry.create!(meal_id: meal4.id, food_id: "nop", food_name: "cheddar cheese")
    food_entry6 = FoodEntry.create!(meal_id: meal5.id, food_id: "nop", food_name: "cheddar cheese")

    get "/api/v1/users/#{user.id}/foods", params: { method: "top_10"}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    foods = JSON.parse(response.body, symbolize_names: true)

    expect(foods).to be_a(Hash)
    expect(foods).to have_key(:data)
    expect(foods[:data]).to be_an(Array)
    expect(foods[:data].first).to have_key(:attributes)
    expect(foods[:data].first[:attributes][:name]).to eq("pop tart")
    expect(foods[:data].first[:attributes][:average_rank]).to eq("9.5")
    expect(foods[:data].last[:attributes][:name]).to eq("cheddar cheese")
    expect(foods[:data].last[:attributes][:average_rank]).to eq("6.5")
  end

  it 'returns foods for a given user with a method param of top_10' do
    user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
    meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 10, meal_time: "00:00:00")
    meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 9, meal_time: "00:00:00")
    meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
    meal4 = Meal.create!(name: "Fourth meal", user_id: user.id, rank: 7, meal_time: "00:00:00")
    meal5 = Meal.create!(name: "Fifth meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
    food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
    food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")
    food_entry3 = FoodEntry.create!(meal_id: meal3.id, food_id: "def", food_name: "blueberry")
    food_entry4 = FoodEntry.create!(meal_id: meal4.id, food_id: "hij", food_name: "strawberry")
    food_entry5 = FoodEntry.create!(meal_id: meal4.id, food_id: "nop", food_name: "cheddar cheese")
    food_entry6 = FoodEntry.create!(meal_id: meal5.id, food_id: "nop", food_name: "cheddar cheese")

    get "/api/v1/users/#{user.id}/foods", params: { method: "bottom_10"}

    expect(response).to be_successful
    expect(response.status).to eq(200)

    foods = JSON.parse(response.body, symbolize_names: true)

    expect(foods).to be_a(Hash)
    expect(foods).to have_key(:data)
    expect(foods[:data]).to be_an(Array)
    expect(foods[:data].first).to have_key(:attributes)
    expect(foods[:data].first[:attributes][:name]).to eq("cheddar cheese")
    expect(foods[:data].first[:attributes][:average_rank]).to eq("6.5")
    expect(foods[:data].last[:attributes][:name]).to eq("pop tart")
    expect(foods[:data].last[:attributes][:average_rank]).to eq("9.5")
  end

  it 'returns an error if user does not exist' do
    user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl", id: 1)
    meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
    meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
    meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 5, meal_time: "00:00:00")
    food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
    food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")

    get "/api/v1/users/2/foods"

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
