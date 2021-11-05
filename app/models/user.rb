class User < ApplicationRecord
  has_many :meals
  has_many :food_entries, through: :meals
end
