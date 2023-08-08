Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get "/recipes", to: "recipes#index"
      get "/learning_resources", to: "learning_resources#index"
      get "/favorites", to: "favorites#index"
      post "/favorites", to: "favorites#create"
      post "/sessions", to: "sessions#create"
    end
  end
end
