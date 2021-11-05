require 'rails_helper'

RSpec.describe "food search index endpoint" do
  it 'returns foods from search' do
    get '/api/v1/foods/search', params: { food_search: "blueberry" }

    expect(response).to be_successful
  end
end
