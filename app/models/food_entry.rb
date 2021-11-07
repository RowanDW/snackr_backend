class FoodEntry < ApplicationRecord
  belongs_to :meal
  has_one :user, through: :meal


  def self.foods_with_rank(current_user)
    joins(meal: :user)
    .select("food_entries.*, AVG(food_entries.meal.rank) as food_rank")
    .where("meals.user_id = current_user.id")
    .group("food_entries.food_id")
  end
end
