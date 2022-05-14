Rails.application.routes.draw do
  devise_for :users
  root to: "schedules#index"
  resources :schedules
  resources :users, only: :show
  resources :cars, only: [:index, :new, :create, :show] 
end
 