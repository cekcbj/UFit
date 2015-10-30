class WorkoutItem < ActiveRecord::Base
  belongs_to :workouts
  belongs_to :exercises
end
