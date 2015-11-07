class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new params.require(:exercise).permit(:name)
    if @exercise.save
      redirect_to root_path, notice: "Exercise added"
    else
      render :new
    end
  end

end
