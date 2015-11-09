class AddColumnsBeganToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :began, :boolean, null:false, default:false
    add_column :workouts, :completed, :boolean, null:false, default:false
  end
end
