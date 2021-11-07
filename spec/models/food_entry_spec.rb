require 'rails_helper'

RSpec.describe FoodEntry do
  describe 'relationships' do
    it { should belong_to(:meal) }
    it { should have_one(:user).through(:meal) }
  end

  describe 'class methods' do
    it '#foods_with_rank' do
      user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
      meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
      meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
      meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 5, meal_time: "00:00:00")
      food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
      food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")

      expect(FoodEntry.foods_with_rank(user).first).to be_a(FoodEntry)
      expect(FoodEntry.foods_with_rank(user).first.food_id).to eq("abc")
      expect(FoodEntry.foods_with_rank(user).first.food_name).to eq("pop tart")
      expect(FoodEntry.foods_with_rank(user).first.average_rank).to eq(0.7e1)
    end
  end
end
