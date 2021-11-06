require 'rails_helper'

RSpec.describe 'food service', :vcr do
  it 'finds food based on food name search' do
    response = FoodService.food_search("frosted flakes")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:hints)
    expect(response[:hints]).to be_an(Array)
    expect(response[:hints].first).to be_a(Hash)
    expect(response[:hints].first[:food]).to be_a(Hash)
    expect(response[:parsed].first[:food][:foodId]).to be_a(String)
    expect(response[:parsed].first[:food][:label]).to be_a(String)
  end
end
