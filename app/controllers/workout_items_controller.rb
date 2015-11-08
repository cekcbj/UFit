class WorkoutItemsController < ApplicationController

  def new
    @workout= Workout.find(params[:id])
    @workout_item = @workout.workout_items.new
    @workout_item.build_exercise
    end

    def create 
      @workout = Workout.find(params[:id])
      @workout_item = Workout.find(params[:id]).workout_items.new(workout_item_params)
      if @workout_item.save
        redirect_to workout_path(id: @workout.id)
      end
    end

      def edit
        @workout_item = workout_item.find(params[:id])
      end

      def destroy
        @workout = workout_item.find params[:id]
        @workout.destroy
        redirect_to root_path
      end




    def workout_item_params
     params.require(:workout_item).permit(:reps, :sets, :exercise_id, exercise_attributes:[ :id, :name])
   end

end
