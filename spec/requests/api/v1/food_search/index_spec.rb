require 'rails_helper'

RSpec.describe "food search index endpoint", :vcr do
  it 'returns foods from search if a food search param is given' do
    get '/api/v1/foods/search', params: { food_search: "blueberry" }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    foods = JSON.parse(response.body, symbolize_names: true)

    expect(foods).to have_key(:data)
    expect(foods[:data]).to be_an(Array)

    foods[:data].each do |food|
      expect(food).to have_key(:id)
      expect(food[:id]).to be_a(String)

      expect(food).to have_key(:type)
      expect(food[:type]).to be_a(String)

      expect(food).to have_key(:attributes)
      expect(food[:attributes]).to be_a(Hash)

      expect(food[:attributes]).to have_key(:name)
      expect(food[:attributes][:name]).to be_a(String)
    end
  end

  it 'returns a 400 error if no search param is given' do
    get '/api/v1/foods/search'

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
