class RenameColumnCompleteInWorkoutItemsToCompleted < ActiveRecord::Migration
  def change
    rename_column :workout_items, :complete, :completed
  end
end
