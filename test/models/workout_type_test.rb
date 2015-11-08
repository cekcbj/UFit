require "test_helper"

class WorkoutTypeTest < ActiveSupport::TestCase
  def workout_type
    @workout_type ||= WorkoutType.new
  end

  def test_valid
    assert workout_type.valid?
  end
end
