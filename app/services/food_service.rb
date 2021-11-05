class FoodService
  class << self
    def food_search(food)
      response = conn.get("/api/food-database/v2/parser") do |f|
        f.params['ingr'] = food
      end
      require 'pry'; binding.pry
      parse_json(response)
    end

    private

    def conn
      Faraday.new("https://api.edamam.com") do |f|
        f.params['app_id'] = ENV['app_id']
        f.params['app_key'] = ENV['app_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
