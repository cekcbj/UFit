require "test_helper"

class CanAddWorkoutTest < Capybara::Rails::TestCase
  test "add things" do
    visit root_path
    assert_content page, "Hello World"
    refute_content page, "Goobye All!"
  end
end
