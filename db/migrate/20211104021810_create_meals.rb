class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :rank
      t.string :meal_time

      t.timestamps
    end
  end
end
