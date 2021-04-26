Rails.application.routes.draw do

  get 'log', to: 'sessions#login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'expenses/expense_ungrouped', to: 'expenses#expense_ungrouped'
  resources :groups 
  resources :expenses

  root 'users#home'

  resources :users, only: %i[show update destroy home edit new create]


end
