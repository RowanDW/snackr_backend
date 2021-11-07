class SetDefaultMealRank < ActiveRecord::Migration[6.1]
  def change
    change_column :meals, :rank, :integer, :default => -1
  end
end
