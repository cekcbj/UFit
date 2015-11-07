class AddCompletedToWorkoutItems < ActiveRecord::Migration
  def change
    add_column :workout_items, :complete, :boolean, null:false, default:false
  end
end
