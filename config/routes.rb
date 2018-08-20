Rails.application.routes.draw do
  # get 'tickets/index'
  # get 'tickets/new'
  # get 'tickets/create'
  # get 'tickets/edit'
  # get 'tickets/update'
  # get 'tickets/destroy'
  devise_for :users
  root to: 'tickets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, except: [:show]
end
