require 'rails_helper'

RSpec.describe 'the update meal endpoint' do
  before :each do
    @user = User.create!(name: "Rowan", email: "rowan@test.com", access_token: '12345')
    @user2 = User.create!(name: "Jamie", email: "jamie@test.com", access_token: '23456')

    @meal1 = @user.meals.create!(name: "Breakfast", meal_time: '2021-11-06T08:30:00+00:00')
    @meal2 = @user.meals.create!(name: "Lunch", meal_time: '2021-11-06T012:30:00+00:00')
    @meal3 = @user2.meals.create!(name: "Breakfast", meal_time: '2021-11-06T07:00:00+00:00')

    @food1 = @meal1.food_entries.create!(food_name: 'Avocado', food_id: 1)
    @food2 = @meal2.food_entries.create!(food_name: 'Burger', food_id: 2)
  end

  it "can update a meal given the meal id" do
    expect(@meal1.rank).to eq(-1)

    patch "/api/v1/users/#{@user.id}/meals", params: {rank: 8, meal_id: @meal1.id}
    expect(response).to be_successful

    meal = JSON.parse(response.body, symbolize_names: true)

    expect(meal).to be_a Hash
    expect(meal[:data]).to be_a Hash
    expect(meal[:data][:id]).to eq(@meal1.id)
    expect(meal[:data][:type]).to eq('meal')
    expect(meal[:data][:attributes]).to be_a Hash
    expect(meal[:data][:attributes][:name]).to eq(@meal1.name)
    expect(meal[:data][:attributes][:meal_time].to_datetime).to eq(@meal1.meal_time)
    expect(meal[:data][:attributes][:rank]).to eq(8)
  end

  it "returns an error given bad meal id" do
    patch "/api/v1/users/#{@user.id}/meals", params: {rank: 8, meal_id: (@meal1.id + 22)}
    expect(response).to_not be_successful
    expect(response).to have_http_status(:not_found)
  end
end
