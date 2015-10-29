require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  def workout
    @workout ||= Workout.new
  end

  def test_valid
    assert workout.valid?
  end
end
