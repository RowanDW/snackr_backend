class User < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :food_entries, through: :meals

  def get_meals(date)
    meals.where(meal_time: date.to_datetime.beginning_of_day..date.to_date.end_of_day)
  end
end
