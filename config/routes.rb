Rails.application.routes.draw do
  resources :system_users
  resources :reviews
  resources :game_systems
  resources :systems
  resources :games
  resources :users

  delete '/logout', to: 'sessions#logout', as: 'logout'
  
  get '/login', to: 'sessions#new_login', as: 'new_login'

  post '/login', to: 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
