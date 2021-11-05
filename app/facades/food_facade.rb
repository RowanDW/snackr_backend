class FoodFacade
  class << self
    def find_foods(food)
      results = FoodService.food_search(food)
      results.map do |result|
        Food.new(result)
      end
    end
  end
end
