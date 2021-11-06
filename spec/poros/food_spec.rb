require 'rails_helper'

RSpec.describe 'food poro' do
  it 'exists and has attributes' do
    data = { food:
              { label: "strawberry",
                foodId: "food_lkj309fnbn222344"
              }
            }
            
    food = Food.new(data)

    expect(food).to be_a(Food)
    expect(food.name).to eq("strawberry")
    expect(food.id).to eq("food_lkj309fnbn222344")
  end
end
