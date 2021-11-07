class FoodEntry < ApplicationRecord
  belongs_to :meal
  has_one :user, through: :meal


  def self.foods_with_rank(current_user)
      raw_food = FoodEntry.joins(meal: :user)
      .select("food_entries.*, meals.rank")
      .where("meals.user_id = ?", current_user.id)

      result = select("food_name, food_id, AVG(rank) as average_rank")
          .from(raw_food, :raw_food)
          .group(:food_id, :food_name)
          .order(average_rank: :desc)

    end
end
