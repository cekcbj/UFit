class AddColumnsToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :date, :datetime
    add_column :workouts, :time, :time
  end
end
