require 'rails_helper'

RSpec.describe Meal do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:food_entries) }
  end

  describe '#add_foods(food_params)' do
    it 'adds an array of food entry params to a meal' do
      user    = User.create!(name: "Rowan", email: "rowan@test.com", access_token: '12345')
      a_toast = user.meals.create!(name: 'Avocado toast', meal_time: "2021-11-26T18:32")
      params  = [
        {
          food_name: 'avocado',
          food_id:   '1234'
        },
        {
          food_name: 'bread',
          food_id:   '6543'
        }
      ]

      expect(a_toast.food_entries.count).to eq(0)

      a_toast.add_foods(params)

      expect(a_toast.food_entries.count).to eq(2)
      expect(a_toast.food_entries.first.food_name).to eq('avocado')
      expect(a_toast.food_entries.first.food_id).to eq('1234')
    end
  end
end
