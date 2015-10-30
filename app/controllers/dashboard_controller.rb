class DashboardController < ApplicationController
  def index
    @workouts = Workout.all
    @workouts_by_date = @workouts.group_by(&:date)
  end 
end
