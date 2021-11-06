require 'rails_helper'

RSpec.describe FoodEntry do
  describe 'relationships' do
    it { should belong_to(:meal) }
    it { should have_one(:user).through(:meal) }
  end
end
