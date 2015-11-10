json.workout_item do
  json.id @workout_item.id
  json.reps @workout_item.reps
  json.sets @workout_item.sets
  json.completed @workout_item.completed
  json.exercise @workout_item.exercise
end
