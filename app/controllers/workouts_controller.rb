class WorkoutsController < ApplicationController

  def new
    @workout =  Workout.new
    @workout.workout_items.build.build_exercise
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      redirect_to workout_path(id: @workout.id)
    end
  end

  def show
    @workout = Workout.find_by(id: params[:id])
  end

  def edit
    @workout = Workout.find_by(id: params[:id])
end


  def update
     @workout = Workout.find_by(id: params[:id])
     if @workout.update workout_params
       redirect_to workout_path(id: @workout.id)
     else
       render :edit
     end
   end

     def destroy
       @workout = Workout.find_by(id: params[:id])
       @workout.destroy
       redirect_to root_path
     end

     def steal
       @my_workout = Workout.find(params[:id])
       @new_workout = @my_workout.amoeba_dup
       @new_workout.user = current_user
       @new_workout.save
       redirect_to user_path(id: current_user.id)
     end



  private

  def workout_params
    params.require(:workout).permit(:name, :time, :began, :complete, schedule_attributes: Schedulable::ScheduleSupport.param_names)
  end

end
