class CreateWorkoutOccurrences < ActiveRecord::Migration
  def change
    create_table :workout_occurrences do |t|
      t.integer :schedulable_id
      t.string :schedulable_type
      t.datetime :date

      t.timestamps null: false
    end
  end
end
