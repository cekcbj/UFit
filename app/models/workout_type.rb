class WorkoutType < ActiveRecord::Base
  has_many :exercises
end
