class AddColumnScheduleTypeToWorkoutOccurrences < ActiveRecord::Migration
  add_index "workout_occurrences", ["schedulable_type", "schedulable_id"], name: "index_workout_occurrences_on_schedulable_type_schedulable_id"
end
