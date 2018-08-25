Rails.application.routes.draw do
  # get 'tickets/index'
  # get 'tickets/new'
  # get 'tickets/create'
  # get 'tickets/edit'
  # get 'tickets/update'
  # get 'tickets/destroy'
  devise_for :users
  root to: 'tickets#index'
  get '/archive', to: 'pages#archive'
  get '/dashboard', to: 'pages#dashboard'
  get '/user_dashboard', to: 'pages#user_dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, except: [:show] do
    member do
      get 'assign', to: 'tickets#assign_edit'
      patch 'assign', to: 'tickets#assign_update'
      patch 'solved', to: 'tickets#status_solved'
    end
  end
end
