require 'rails_helper'

RSpec.describe Chart do
  before :each do
    @user = User.create!(name: "Billy Bob", email: "billybob@gmail.com", access_token: "daigrjslei23590sdgjkl")

    @meal1 = Meal.create!(name: "First meal", user_id: @user.id, rank: 2, meal_time: "00:00:00")
    @meal2 = Meal.create!(name: "Second meal", user_id: @user.id, rank: 8, meal_time: "00:00:00")
    @meal3 = Meal.create!(name: "Third meal", user_id: @user.id, rank: 5, meal_time: "00:00:00")
    @meal4 = Meal.create!(name: "Fourth meal", user_id: @user.id, rank: 3, meal_time: "00:00:00")
    @meal5 = Meal.create!(name: "Fifth meal", user_id: @user.id, rank: 9, meal_time: "00:00:00")

    @food_entry1 = FoodEntry.create!(meal_id: @meal1.id, food_id: "1", food_name: "blueberry")
    @food_entry2 = FoodEntry.create!(meal_id: @meal1.id, food_id: "2", food_name: "pop tart")
    @food_entry3 = FoodEntry.create!(meal_id: @meal2.id, food_id: "3", food_name: "macaroni")
    @food_entry4 = FoodEntry.create!(meal_id: @meal2.id, food_id: "4", food_name: "apricot")
    @food_entry5 = FoodEntry.create!(meal_id: @meal3.id, food_id: "5", food_name: "apple")
    @food_entry6 = FoodEntry.create!(meal_id: @meal3.id, food_id: "6", food_name: "rice")
    @food_entry7 = FoodEntry.create!(meal_id: @meal4.id, food_id: "7", food_name: "broccoli")
    @food_entry8 = FoodEntry.create!(meal_id: @meal4.id, food_id: "8", food_name: "spaghetti")
    @food_entry9 = FoodEntry.create!(meal_id: @meal5.id, food_id: "9", food_name: "zucchini")
    @food_entry10 = FoodEntry.create!(meal_id: @meal1.id, food_id: "10", food_name: "bagel")
    @food_entry11 = FoodEntry.create!(meal_id: @meal1.id, food_id: "11", food_name: "couscous")
    @food_entry12 = FoodEntry.create!(meal_id: @meal2.id, food_id: "12", food_name: "mango")
    @food_entry13 = FoodEntry.create!(meal_id: @meal2.id, food_id: "6", food_name: "rice")
    @food_entry14 = FoodEntry.create!(meal_id: @meal3.id, food_id: "14", food_name: "pizza")
    @food_entry15 = FoodEntry.create!(meal_id: @meal3.id, food_id: "10", food_name: "bagel")
    @food_entry16 = FoodEntry.create!(meal_id: @meal4.id, food_id: "16", food_name: "banana peppers")
    @food_entry17 = FoodEntry.create!(meal_id: @meal4.id, food_id: "17", food_name: "naan bread")
    @food_entry18 = FoodEntry.create!(meal_id: @meal5.id, food_id: "18", food_name: "hummus")
    @food_entry19 = FoodEntry.create!(meal_id: @meal5.id, food_id: "19", food_name: "chickpeas")
    @food_entry20 = FoodEntry.create!(meal_id: @meal5.id, food_id: "20", food_name: "lentils")
  end
  it '#ten_highest_ranked' do
    chart = Chart.ten_highest_ranked(@user)
    name_params = "chdl=zucchini|lentils|chickpeas|hummus|mango|apricot|macaroni|rice|pizza|apple"
    rank_params = "chd=t:9.0|9.0|9.0|9.0|8.0|8.0|8.0|6.5|5.0|5.0"

    expect(chart).to be_a Chart
    expect(chart.name).to eq("10_Highest")
    expect(chart.uri.include?(name_params)).to eq(true)
    expect(chart.uri.include?(rank_params)).to eq(true)
  end
  it '#ten_lowest_ranked' do
    chart = Chart.ten_lowest_ranked(@user)
    name_params = "chdl=blueberry|couscous|pop tart|broccoli|banana peppers|naan bread|spaghetti|bagel|pizza|apple"
    rank_params = "chd=t:2.0|2.0|2.0|3.0|3.0|3.0|3.0|3.5|5.0|5.0"

    expect(chart).to be_a Chart
    expect(chart.name).to eq("10_Lowest")
    expect(chart.uri.include?(name_params)).to eq(true)
    expect(chart.uri.include?(rank_params)).to eq(true)
  end
end
