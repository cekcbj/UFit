require "test_helper"

class WorkoutItemTest < ActiveSupport::TestCase
  def workout_item
    @workout_item ||= WorkoutItem.new
  end

  def test_valid
    assert workout_item.valid?
  end
end
