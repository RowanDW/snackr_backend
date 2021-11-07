require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:meals) }
    it { should have_many(:food_entries).through(:meals) }
  end

  it ".get_meals" do
    user = User.create!(name: "Rowan", email: "rowan@test.com", access_token: '12345')
    user2 = User.create!(name: "Jamie", email: "jamie@test.com", access_token: '23456')

    meal1 = user.meals.create!(name: "Breakfast", meal_time: '2021-11-06T08:30:00+00:00')
    meal2 = user.meals.create!(name: "Lunch", meal_time: '2021-11-06T012:30:00+00:00')
    meal3 = user.meals.create!(name: "Lunch", meal_time: '2021-11-07T012:30:00+00:00')
    meal4 = user2.meals.create!(name: "Breakfast", meal_time: '2021-11-06T07:00:00+00:00')

    food1 = meal1.food_entries.create!(food_name: 'Avocado', food_id: 1)
    food2 = meal2.food_entries.create!(food_name: 'Burger', food_id: 2)

    expect(user.get_meals('2021-11-06T08:30:00+00:00')).to eq([meal1, meal2])
  end
end
