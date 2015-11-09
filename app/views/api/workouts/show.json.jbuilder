json.workout do
  json.id @workout.id
  json.name @workout.name
  json.began @workout.began
  json.completed @workout.completed
  json.workout_items @workout.workout_items do |workout_item|
    json.id workout_item.id
    json.reps workout_item.reps
    json.sets workout_item.sets
    json.completed workout_item.completed

    json.exercise workout_item.exercise
  end
end
