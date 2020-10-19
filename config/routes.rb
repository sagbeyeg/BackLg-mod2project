Rails.application.routes.draw do
  resources :system_users
  resources :reviews
  resources :game_systems
  resources :systems
  resources :games
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
