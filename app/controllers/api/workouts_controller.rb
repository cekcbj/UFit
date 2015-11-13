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
    @workout_items = @workout.workout_items
    pp @workout_items

    render(:show)
  end

  def began
    @workout = Workout.find_by(id: params[:id])
    pp "--- @workout before ----" *20
    pp @workout

    @workout.began = true
    @workout.save
    pp @workout
    render(:show)
  end
  def completed
    @workout = Workout.find_by(id: params[:id])
    pp "--- @workout before ----" *20
    pp @workout

    @workout.completed = true
    @workout.save
  end

  def workout_params
    params.require(:workout).permit(:name, :date, :time, :began, :completed, :reps, :sets)
  end
end
