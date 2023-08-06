Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get "/recipes", to: "recipes#index"
      get "/learning_resources", to: "learning_resources#index"
      post "/sessions", to: "sessions#create"
      post "/favorites", to: "favorites#create"
    end
  end
end
