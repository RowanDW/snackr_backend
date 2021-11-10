require 'rails_helper'

RSpec.describe GraphSerializer do
  before :each do
    @user = User.create!(name: "Biggie", email: "justafriend@gmail.com", access_token: "daigrjslei23590sdgjkl")

    @meal1 = Meal.create!(name: "First meal", user_id: @user.id, rank: 2, meal_time: "00:00:00")
    @meal2 = Meal.create!(name: "Second meal", user_id: @user.id, rank: 8, meal_time: "00:00:00")
    @meal3 = Meal.create!(name: "Third meal", user_id: @user.id, rank: 5, meal_time: "00:00:00")
    @meal4 = Meal.create!(name: "Fourth meal", user_id: @user.id, rank: 3, meal_time: "00:00:00")
    @meal5 = Meal.create!(name: "The Last Meal", user_id: @user.id, rank: 9, meal_time: "00:00:00")

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
  it 'serializes graph data into json' do
    highest = Graph.ten_highest_ranked(@user)
    lowest = Graph.ten_lowest_ranked(@user)
    graphs = GraphSerializer.get_graphs(highest, lowest)[:data]

    expect(graphs).to be_an Array
    expect(graphs.count).to eq(2)

    graphs.each do |graph|
      expect(graph[:type]).to eq("graph")
      expect(graph[:attributes]).to be_a Hash
      expect(graph[:attributes][:name]).to be_a String
      expect(graph[:attributes][:uri]).to be_a String
    end
  end
end
