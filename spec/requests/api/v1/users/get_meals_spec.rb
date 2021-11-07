require 'rails_helper'

RSpec.describe 'get meals endpoint' do

  it "returns all meals for a user on the given date" do
    user = User.create!(name: "Rowan", email: "rowan@test.com", access_token: '12345')
    user2 = User.create!(name: "Jamie", email: "jamie@test.com", access_token: '23456')

    meal1 = user.meals.create!(name: "Breakfast", meal_time: '2021-11-06T08:30:00+00:00')
    meal2 = user.meals.create!(name: "Lunch", meal_time: '2021-11-06T012:30:00+00:00')
    meal3 = user2.meals.create!(name: "Breakfast", meal_time: '2021-11-06T07:00:00+00:00')

    food1 = meal1.food_entries.create!(food_name: 'Avocado', food_id: 1)
    food2 = meal2.food_entries.create!(food_name: 'Burger', food_id: 2)

    get "/api/v1/users/#{user.id}/meals", params: {date: '2021-11-06T00:14:46+00:00'}
    expect(response).to be_successful

    meals = JSON.parse(response.body, symbolize_names: true)

    expect(meals).to be_a Hash
    expect(meals[:data]).to be_a Array
    expect(meals[:data].count).to eq(2)

    first_meal = meals[:data].first
    expect(first_meal[:id]).to eq(meal1.id.to_s)
    expect(first_meal[:type]).to eq('meal')
    expect(first_meal[:attributes]).to be_a Hash
    expect(first_meal[:attributes][:name]).to eq(meal1.name)
    expect(first_meal[:attributes][:rank]).to eq(-1)
    expect(first_meal[:attributes][:meal_time].to_datetime).to eq(meal1.meal_time)
    expect(first_meal[:attributes][:food_entries]).to be_a Array

    first_food = first_meal[:attributes][:food_entries].first
    expect(first_food[:id]).to eq(food1.id)
    expect(first_food[:food_name]).to eq(food1.food_name)
    expect(first_food[:meal_id]).to eq(meal1.id)
    expect(first_food[:food_id]).to eq(food1.food_id)
  end
end
