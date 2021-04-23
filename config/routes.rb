Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  get 'log', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :groups # do
  resources :expenses
  #vend
  root 'users#home'

  resources :users, only: %i[show update destroy home edit new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
