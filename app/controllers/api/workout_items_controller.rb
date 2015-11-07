class Api::WorkoutItemsController < ApplicationController

  before_action do
   request.format = :json
   end

  def complete
    @workout= Workout.find(params[:id])
  end
end
