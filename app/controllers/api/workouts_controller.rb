class Api::WorkoutsController < ApplicationController

   before_action do
     request.format = :json
     end

  def new
    @workout = Workout.new
  end

  def index
    @workouts = Workout.all
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.save
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :date, :time, :reps, :sets)
  end
end
