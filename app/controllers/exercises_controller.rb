class ExercisesController < ApplicationController
    before_action :set_workout
  
    def create
        @workout = Workout.find(params[:workout_id])
        @exercise = @workout.exercises.create(exercise_params)
        redirect_to @workout
      end
  
    private
  
    def set_workout
      @workout = Workout.find(params[:workout_id])
    end
  
    def exercise_params
        params.require(:exercise).permit(:name, :sets, :reps)
    end
  end