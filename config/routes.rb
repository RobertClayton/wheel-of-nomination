Rails.application.routes.draw do
  resources :spins
  resources :scoreboards
  resources :questions
  resources :nomination
  resources :users
  resources :teams

  get 'jeopardy', to: 'jeopardy#index'

  root :to => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
