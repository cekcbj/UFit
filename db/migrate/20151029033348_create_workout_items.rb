class CreateWorkoutItems < ActiveRecord::Migration
  def change
    create_table :workout_items do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.integer :sets
      t.integer :reps

      t.timestamps null: false
    end
  end
end
