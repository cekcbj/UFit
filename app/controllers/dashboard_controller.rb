class DashboardController < ApplicationController
  def index
    if logged_in?
      @workouts = current_user.workouts
      @workouts_by_date = @workouts.group_by(&:date)
   end
  end

  def show
    @workout = Workout.find_by(id: params[:workout_id])
  end
end
