class DashboardController < ApplicationController
  def index
    @workouts = Workout.all
  end
end
