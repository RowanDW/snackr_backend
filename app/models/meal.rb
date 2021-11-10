class Meal < ApplicationRecord
  belongs_to :user
  has_many :food_entries, dependent: :destroy

  def add_foods(foods_params)
    foods_params.each do |food_params|
      food_entries.create(food_params)
    end
  end
end
