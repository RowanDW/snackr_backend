require 'rails_helper'

RSpec.describe Meal do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:food_entries) }
  end
end
