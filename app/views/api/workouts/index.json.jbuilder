json.workouts @workouts do |workout|
  json.id workout.id
  json.name workout.name
  json.reps workout.reps
  json.sets workout.sets
end
