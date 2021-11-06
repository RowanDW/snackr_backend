require 'rails_helper'

RSpec.describe 'food facade', :vcr do
  it 'can find foods based on search param' do
    foods = FoodFacade.find_foods("peanut butter")
  
    expect(foods).to be_an(Array)
    expect(foods.first).to be_a(Food)
  end
end
