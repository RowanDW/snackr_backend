# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: "Billy Bob", email: "billybob@test.com", access_token: "daigrjslei23590sdgjkl")
user2 = User.create!(name: "John Doe", email: "johndoes@test.com", access_token: "daigrjslei123545fdsfad")

meal1 = Meal.create!(name: "First meal", user_id: user.id, rank: 6, meal_time: "2021-11-06T08:30:00+00:00")
meal2 = Meal.create!(name: "Second meal", user_id: user.id, rank: 8, meal_time: "2021-11-06T1:30:00+00:00")
meal3 = Meal.create!(name: "Third meal", user_id: user.id, rank: 5, meal_time: "2021-11-06T07:00:00+00:00")

food_entry1 = FoodEntry.create!(meal_id: meal1.id, food_id: "abc", food_name: "pop tart")
food_entry2 = FoodEntry.create!(meal_id: meal2.id, food_id: "abc", food_name: "pop tart")
food_entry3 = FoodEntry.create!(meal_id: meal3.id, food_id: "bcd", food_name: "Burger")
food_entry4 = FoodEntry.create!(meal_id: meal3.id, food_id: "cde", food_name: "Fries")
food_entry5 = FoodEntry.create!(meal_id: meal3.id, food_id: "def", food_name: "Pepsi")
