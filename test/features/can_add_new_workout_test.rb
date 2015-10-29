require "test_helper"

class CanAddNewWorkoutTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    click_link "Add Workout"
    assert_content page, "Name"
  end
end
