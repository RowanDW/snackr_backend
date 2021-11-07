class FoodEntrySerializer
  include JSONAPI::Serializer
  attributes :food_name, :food_id, :meal_id
end
