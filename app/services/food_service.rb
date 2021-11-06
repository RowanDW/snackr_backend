class FoodService
  class << self
    def food_search(food)
      response = Faraday.get("https://api.edamam.com/api/food-database/v2/parser?app_id=#{ENV['app_id']}&app_key=#{ENV['app_key']}&ingr=#{food}")
      parse_json(response)
    end

    private

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
