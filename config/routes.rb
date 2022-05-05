Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users
  root to: "schedules#index"
  resources :schedules
  resources :users, only: :show
end
 