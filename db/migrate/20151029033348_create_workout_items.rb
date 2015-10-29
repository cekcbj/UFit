class CreateWorkoutItems < ActiveRecord::Migration
  def change
    create_table :workout_items do |t|
      t.integer :workout_id
      t.integer :exercise_id

      t.timestamps null: false
    end
  end
end
