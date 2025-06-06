Rails.application.routes.draw do
  # Authentication routes
  devise_for :users, controllers: {
  sessions: 'users/sessions'
  }

  # Workouts routes
  resources :workouts do
    # Nested exercises routes
    resources :exercises, only: [:create, :destroy]
    
    # Collection routes
    collection do
      get 'programs'
      get 'statistics'
    end
  end

  # Root route
  root 'workouts#index'
end