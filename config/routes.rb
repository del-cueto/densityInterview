Rails.application.routes.draw do
  namespace :admin do
    resources :courses, exclude: [:new, :edit]
    resources :users, exclude: [:new, :edit]
    resources :enrollments, only: [:index, :create, :destroy] do 
      resources :grades, only: [:index, :create, :update, :destroy]
    end
  end

  namespace :student do
    resources :courses, only: [:index]
    resources :users, only: [:index]
    resources :enrollments, only: [:index] do 
      resources :grades, only: [:index]
    end
  end

  devise_for :users
  resources :student do
    resources :enrollments, only: [:index, :new, :create, :destroy] do 
      resources :grades, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end
  
  # root to: "home#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  



  # Defines the root path route ("/")
  # root "posts#index"
end
