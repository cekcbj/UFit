require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  def exercise
    @exercise ||= Exercise.new
  end

  def test_valid
    assert exercise.valid?
  end
end
