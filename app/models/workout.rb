class Workout < ActiveRecord::Base
  acts_as_schedulable :schedule
end
