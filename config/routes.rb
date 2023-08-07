Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get "/air_quality", to: "air_quality#show"
      get "/recipes", to: "recipes#index"
      get "/learning_resources", to: "learning_resources#index"
      get "/favorites", to: "favorites#index"
      post "/favorites", to: "favorites#create"
      post "/sessions", to: "sessions#create"
    end
  end
end
