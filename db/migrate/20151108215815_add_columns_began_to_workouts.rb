class AddColumnsBeganToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :began, :boolean
    add_column :workouts, :completed, :boolean
  end
end
