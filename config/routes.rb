Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :favorites, only: [:index, :create, :destroy]
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      resources :sessions, only: [:create]
    end
  end
end
