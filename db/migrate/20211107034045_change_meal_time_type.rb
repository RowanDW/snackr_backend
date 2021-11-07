class ChangeMealTimeType < ActiveRecord::Migration[6.1]
  def change
    remove_column :meals, :meal_time
    add_column :meals, :meal_time, :datetime
  end
end
