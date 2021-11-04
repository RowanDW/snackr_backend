class CreateFoodEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :food_entries do |t|
      t.references :meal, null: false, foreign_key: true
      t.string :food_id
      t.string :food_name

      t.timestamps
    end
  end
end
