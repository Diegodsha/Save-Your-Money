Rails.application.routes.draw do
  root 'users#home'
  get 'log', to: 'sessions#login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'expenses/expense_ungrouped', to: 'expenses#expense_ungrouped'

  resources :groups, only: %i[show destroy new create index update edit]
  resources :expenses, only: %i[show destroy new create index]
  resources :users, only: %i[show update destroy home edit new create]
end
