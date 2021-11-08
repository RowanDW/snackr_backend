class Meal < ApplicationRecord
  belongs_to :user
  has_many :food_entries

  def add_foods(foods)
    foods.each do |food|
      food_entries.create(food_name: food[:name], food_id: food[:food_id])
    end
  end
end
