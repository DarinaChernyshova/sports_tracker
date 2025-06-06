class WorkoutsController < ApplicationController
    before_action :authenticate_user!
  
    def show
        @workout = Workout.find(params[:id])  # Верно
    end

    def index
      @workouts = current_user.workouts
    end
  
    def new
      @workout = Workout.new
    end
  
    def create
      @workout = current_user.workouts.create(workout_params)
      redirect_to workouts_path
    end
  
    private
  
    def workout_params
      params.require(:workout).permit(:title, :description)
    end
  end