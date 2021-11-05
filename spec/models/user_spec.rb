require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:meals) }
    it { should have_many(:food_entries).through(:meals) }
  end
end
