class FoodEntry < ApplicationRecord
  belongs_to :meal
  belongs_to :user, through: :meal
end
