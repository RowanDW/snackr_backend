class MealSerializer
  def self.new(meals)
    {
      "data": meals.map do |meal|
        {
          "id": meal.id,
          "type": "meal",
          "attributes": {
            "name": meal.name,
            "rank": meal.rank,
            "meal_time": meal.meal_time
          },
          "relationships": {
            "food_entries": {
              "data": meal.food_entries.map do |food_entry|
                {
                  "id": food_entry.id,
                  "meal_id": food_entry.meal_id,
                  "food_id": food_entry.food_id,
                  "food_name": food_entry.food_name
                }
              end
            }
          }
        }
    end
    }
  end
end
