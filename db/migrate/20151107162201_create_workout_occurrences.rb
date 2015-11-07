class CreateWorkoutOccurrences < ActiveRecord::Migration
  def change
    create_table :workout_occurrences do |t|
      t.integer :schedulable_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
