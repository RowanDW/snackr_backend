class MealSerializer
  include JSONAPI::Serializer
  attributes :name, :meal_time, :user_id, :rank, :food_entries
  #has_many :food_entries
end
