class WorkoutsController < ApplicationController

  def new
    @workout =  Workout.new
    @workout.workout_items.build.build_exercise
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      redirect_to root_path
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def edit
    @workout = Workout.find(params[:id])
    @workout_items= @workout.workout_items.all
end


  def update
     @workout = Workout.find params[:id]
     if @workout_items.update workout_params
       redirect_to workout_path(id: @workout.id)
     else
       render :edit
     end
   end

     def destroy
       @workout = Workout.find params[:id]
       @workout.destroy
       redirect_to root_path
     end



  private

  def workout_params
    params.require(:workout).permit(:name, :time, schedule_attributes: Schedulable::ScheduleSupport.param_names, workout_items_attributes: [ :reps, :sets, :exercise_id, exercise_attributes:[ :id, :name]])
  end

end
