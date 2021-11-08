require 'rails_helper'

RSpec.describe 'create meal' do
  before(:each) do
    @user = User.create!(name: "Rowan", email: "rowan@test.com", access_token: '12345')
    @user2 = User.create!(name: "Jamie", email: "jamie@test.com", access_token: '23456')

    @spaghetti  = File.read('spec/fixtures/new_spaghetti.json')

    @headers = {"CONTENT_TYPE" => "application/json"}
  end

  it 'can create a meal' do
    post("/api/v1/users/#{@user.id}/meals", headers: @headers, params: @spaghetti)

    created_meal = Meal.last

    expect(response).to be_successful

    expect(created_meal.id).to        be_an(Integer)
    expect(created_meal.name).to      eq("Spaghetti & Meatballs")
    expect(created_meal.rank).to      eq(-1)
    expect(created_meal.meal_time).to eq("2021-11-26T18:32")
  end

  it 'adds foods to the meal' do
    post("/api/v1/users/#{@user.id}/meals", headers: @headers, params: @spaghetti)

    created_meal  = Meal.last
    created_foods = FoodEntry.all

    expect(created_foods.count).to           eq(2)
    expect(created_foods.first.id).to        be_an(Integer)
    expect(created_foods.first.meal_id).to   eq(created_meal.id)
    expect(created_foods.first.food_id).to   eq('123')
    expect(created_foods.first.food_name).to eq('Meatballs')
  end

  it 'gives an error when user does not exist' do
    post("/api/v1/users/bananas/meals", headers: @headers, params: @spaghetti)

    error = JSON.parse(response.body, symbolize_names: true)[:error]

    expect(response.status).to eq(404)
    expect(error).to           eq('not found')
  end
end
