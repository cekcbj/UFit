class Workout < ActiveRecord::Base
  acts_as_schedulable :schedule

  has_many :workout_items
  has_many :exerices, :through => :workout_items


  def date
    self.schedule.date
  end


end
