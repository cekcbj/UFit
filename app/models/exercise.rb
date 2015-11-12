class Exercise < ActiveRecord::Base
  has_many :workout_items
  has_many :workouts, through: :workout_items
  belongs_to :workout_types
end
