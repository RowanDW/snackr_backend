class FoodFacade
  class << self
    def find_foods(food)
      results = FoodService.food_search(food)
      results[:hints].map do |result|
        Food.new(result)
      end
    end
  end
end
