class Api::WorkoutItemsController < ApplicationController

  before_action do
   request.format = :json
  end


  def new
    @workout= Workout.find(params[:id])
    @workout_item = @workout.workout_items.new
    @workout_item.build_exercise
  end

  def create
    puts "--(api-workoutitems-params)--"*20
    pp params
    @workout = Workout.find_by(id: params[:workout_item][:workout_id])
    @workout_item = @workout.workout_items.new(workout_item_params)

    puts "--(api-workoutitems-PREsave)--"*20
    pp @workout_item
    if @workout_item.save
      @workout = Workout.find(params[:workout_item][:workout_id])
      puts "--(api-workoutitems-POSTsave)--"*20
      pp @workout_item
      # END- JSON on the way out
      render(:show)
    else
      render(json: {msg: 'save NOT successful :('}, status: 400)
    end
  end

   def edit
     @workout_item = workout_item.find(params[:id])
   end

   def update
     puts "--(api-workoutitems-DATA-from-client)--"*20
     dataFromClient = JSON.parse(params[:jsonData])
     #  @workout = Workout.find_by(id: params[:workout_item][:workout_id])

     @workout_item = WorkoutItem.find_by(id: dataFromClient["id"])

     puts "--(api-workoutitems-PREUpdate)--"*20
     pp @workout_item
     @workout_item.completed = true
     if @workout_item.save
       puts "--(api-workoutitems-POSTUpdate)--"*20
       pp @workout_item
       # END- JSON on the way out
       render(:show)
     else
       render(json: {msg: 'save NOT successful :('}, status: 400)
     end
   end

   def destroy
     @workout = workout_item.find params[:id]
     @workout.destroy
     redirect_to root_path
   end

  private
  def workout_item_params
      params.require(:workout_item).permit(
        :reps,
        :sets,
        :workout_id,
        :exercise_id,
        exercise_attributes:[ :id, :name]
      )
    end

  def complete
    @workout= Workout.find(params[:id])
  end
end
