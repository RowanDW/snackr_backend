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

    it '#ten_highest_ranked' do
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
      food_entry7 = FoodEntry.create!(meal_id: meal4.id, food_id: "qrs", food_name: "milk")
      food_entry8 = FoodEntry.create!(meal_id: meal4.id, food_id: "tuv", food_name: "butter")
      food_entry9 = FoodEntry.create!(meal_id: meal4.id, food_id: "wxy", food_name: "pepperoni")
      food_entry10 = FoodEntry.create!(meal_id: meal4.id, food_id: "z12", food_name: "pixie stix")
      food_entry11 = FoodEntry.create!(meal_id: meal4.id, food_id: "345", food_name: "pickles")
      food_entry12 = FoodEntry.create!(meal_id: meal4.id, food_id: "678", food_name: "turkey")
      food_entry13 = FoodEntry.create!(meal_id: meal5.id, food_id: "911", food_name: "pineapple")

      expect(FoodEntry.ten_highest_ranked(user).length).to eq(10)
      expect(FoodEntry.ten_highest_ranked(user).first).to be_a(FoodEntry)
      expect(FoodEntry.ten_highest_ranked(user).first.food_name).to eq("pop tart")
      expect(FoodEntry.ten_highest_ranked(user).last.food_name).to eq("cheddar cheese")
    end

    it '#ten_lowest_ranked' do
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
      food_entry7 = FoodEntry.create!(meal_id: meal4.id, food_id: "qrs", food_name: "milk")
      food_entry8 = FoodEntry.create!(meal_id: meal4.id, food_id: "tuv", food_name: "butter")
      food_entry9 = FoodEntry.create!(meal_id: meal4.id, food_id: "wxy", food_name: "pepperoni")
      food_entry10 = FoodEntry.create!(meal_id: meal4.id, food_id: "z12", food_name: "pixie stix")
      food_entry11 = FoodEntry.create!(meal_id: meal4.id, food_id: "345", food_name: "pickles")
      food_entry12 = FoodEntry.create!(meal_id: meal4.id, food_id: "678", food_name: "turkey")
      food_entry13 = FoodEntry.create!(meal_id: meal5.id, food_id: "911", food_name: "pineapple")

      expect(FoodEntry.ten_lowest_ranked(user).length).to eq(10)
      expect(FoodEntry.ten_lowest_ranked(user).first).to be_a(FoodEntry)
      expect(FoodEntry.ten_lowest_ranked(user).first.food_name).to eq("pineapple")
      expect(FoodEntry.ten_lowest_ranked(user).last.food_name).to eq("blueberry")
    end

    it '#food_rank_subquery' do
      user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
      user2 = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")
      meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 10, meal_time: "00:00:00")
      meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 9, meal_time: "00:00:00")
      meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 8, meal_time: "00:00:00")
      meal4 = Meal.create!(name: "Fourth meal", user_id: user.id, rank: 7, meal_time: "00:00:00")
      meal5 = Meal.create!(name: "Fifth meal", user_id: user.id, rank: 6, meal_time: "00:00:00")
      meal6 = Meal.create!(name: "User2 meal", user_id: user2.id, rank: 6, meal_time: "00:00:00")
      food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
      food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")
      food_entry3 = FoodEntry.create!(meal_id: meal3.id, food_id: "def", food_name: "blueberry")
      food_entry4 = FoodEntry.create!(meal_id: meal4.id, food_id: "hij", food_name: "strawberry")
      food_entry5 = FoodEntry.create!(meal_id: meal4.id, food_id: "nop", food_name: "cheddar cheese")
      food_entry6 = FoodEntry.create!(meal_id: meal5.id, food_id: "nop", food_name: "cheddar cheese")
      food_entry7 = FoodEntry.create!(meal_id: meal4.id, food_id: "qrs", food_name: "milk")
      food_entry8 = FoodEntry.create!(meal_id: meal4.id, food_id: "tuv", food_name: "butter")
      food_entry9 = FoodEntry.create!(meal_id: meal4.id, food_id: "wxy", food_name: "pepperoni")
      food_entry10 = FoodEntry.create!(meal_id: meal4.id, food_id: "z12", food_name: "pixie stix")
      food_entry11 = FoodEntry.create!(meal_id: meal4.id, food_id: "345", food_name: "pickles")
      food_entry12 = FoodEntry.create!(meal_id: meal4.id, food_id: "678", food_name: "turkey")
      food_entry13 = FoodEntry.create!(meal_id: meal5.id, food_id: "911", food_name: "pineapple")
      food_entry14 = FoodEntry.create!(meal_id: meal6.id, food_id: "5309", food_name: "brownies")

      expect(FoodEntry.food_rank_subquery(user).first).to be_a(FoodEntry)
      expect(FoodEntry.food_rank_subquery(user).length).to eq(13)
      expect(FoodEntry.food_rank_subquery(user2).length).to eq(1)
    end
  end
end
