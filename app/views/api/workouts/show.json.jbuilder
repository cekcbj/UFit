json.workout do
  json.id @workout.id
  json.name @workout.name
  json.workout_items @workout.workout_items do |workout_item|
  json.id workout_item.id
  json.reps workout_item.reps
  json.sets workout_item.sets
  json.complete workout_item.complete
  json.exercise workout_item.exercise
    json.id workout_item.exercise.id
    json.name workout_item.exercise.name

end
end
