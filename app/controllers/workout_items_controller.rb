class WorkoutItemsController < ApplicationController

  def new
    @workout= Workout.find(params[:id])
    @workout_item = @workout.workout_items.new
    @workout_item.build_exercise
    end

    def create
      puts "-workout-item-Params"*25
      pp params
      @workout = Workout.find(params[:id])
      @workout_item = @workout.workout_items.new(workout_item_params)
      puts "-workout_item-PRE-save"*50
      pp @workout_item
      if @workout_item.save
        puts "-workout_item-POST-save"*50
        pp @workout_item
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
     params.require(:workout_item).permit(
      :reps,
      :sets,
      :exercise_id,
      exercise_attributes:[ :id, :name]
    )
   end

end
