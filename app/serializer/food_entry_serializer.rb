class FoodEntrySerializer
  def self.new(foods)
    {
      "data": foods.map do |food|
                {
                  "type": 'food_entry',
                  "attributes": {
                    "name": food.food_name,
                    "average_rank": food.average_rank * 1
                  }
                }
              end
    }
  end
end
