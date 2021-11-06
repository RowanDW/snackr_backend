require 'rails_helper'

RSpec.describe 'food serializer' do
  it 'serializes food object into json' do
    data = { food:
              { label: "strawberry",
                foodId: "food_lkj309fnbn222344"
              }
            }

    food = Food.new(data)
    food_json = FoodSerializer.new(food).serializable_hash

    expect(food_json).to be_a(Hash)
    expect(food_json).to have_key(:data)
    expect(food_json[:data]).to be_a(Hash)
    expect(food_json[:data]).to have_key(:id)
    expect(food_json[:data]).to have_key(:type)
    expect(food_json[:data]).to have_key(:attributes)
    expect(food_json[:data][:attributes]).to have_key(:name)
  end
end
