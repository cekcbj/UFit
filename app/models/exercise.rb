class Exercise < ActiveRecord::Base
  has_many :workout_items
  has_many :workouts, through: :workout_items
end
