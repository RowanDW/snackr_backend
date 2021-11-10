class MealSerializer
  def self.get_meals(meals)
    {
      "data": meals.map do |meal|
                {
                  "id": meal.id,
                  "type": 'meal',
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

  def self.one_meal(meal)
    {
      "data": {
        "id": meal.id,
        "type": 'meal',
        "attributes": {
          "name": meal.name,
          "rank": meal.rank,
          "meal_time": meal.meal_time
        }
      }
    }
  end

  def self.one_full_meal(meal)
    {
      "data": {
        "id": meal.id,
        "type": 'meal',
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
    }
  end
end
