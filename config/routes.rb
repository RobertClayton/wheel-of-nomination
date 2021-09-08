Rails.application.routes.draw do
  resources :scores
  resources :spins
  resources :scoreboards
  resources :questions
  resources :nomination
  resources :users
  resources :teams

  get 'jeopardy', to: 'jeopardy#index'
  get 'millionaire', to: 'millionaire#index'

  post 'scoreboards/five_correct', to: 'scoreboards#five_correct'
  get 'scoreboards/five_correct', to: 'scoreboards#five_correct'

  post 'nominations/failed_nomination', to: 'nomination#failed_nomination'
  get 'nominations/failed_nomination', to: 'nomination#failed_nomination'
  post 'nominations/wheel_nomination', to: 'nomination#wheel_nomination'
  get 'nominations/wheel_nomination', to: 'nomination#wheel_nomination'
  post 'nominations', to: 'nomination#create'
  get 'nominations', to: 'nomination#index'

  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
