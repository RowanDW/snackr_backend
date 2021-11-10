class FoodEntry < ApplicationRecord
  belongs_to :meal
  has_one :user, through: :meal

  def self.foods_with_rank(current_user)
    select('food_name, food_id, AVG(rank) as average_rank')
      .from(food_rank_subquery(current_user), :raw_food)
      .group(:food_id, :food_name)
      .order(average_rank: :desc)
  end

  def self.ten_highest_ranked(current_user)
    select('food_name, food_id, AVG(rank) as average_rank')
      .from(food_rank_subquery(current_user), :raw_food)
      .group(:food_id, :food_name)
      .order(average_rank: :desc)
      .limit(10)
  end

  def self.ten_lowest_ranked(current_user)
    select('food_name, food_id, AVG(rank) as average_rank')
      .from(food_rank_subquery(current_user), :raw_food)
      .group(:food_id, :food_name)
      .order(average_rank: :asc)
      .limit(10)
  end

  def self.food_rank_subquery(current_user)
    FoodEntry.joins(meal: :user)
             .select('food_entries.*, meals.rank')
             .where('meals.user_id = ? and meals.rank > ?', current_user.id, 0)
  end
end
