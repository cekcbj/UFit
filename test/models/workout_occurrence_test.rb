require "test_helper"

class WorkoutOccurrenceTest < ActiveSupport::TestCase
  def workout_occurrence
    @workout_occurrence ||= WorkoutOccurrence.new
  end

  def test_valid
    assert workout_occurrence.valid?
  end
end
