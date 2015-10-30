class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.save
  end

  def show
    @workout = Workout.find(params[:id])
    @exercise = Exercise.new
  end





  def workout_params
    params.require(:workout).permit(:name, schedule_attributes: Schedulable::ScheduleSupport.param_names)
  end

end
