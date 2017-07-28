Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/registrate', to: 'items#new'
  post '/registrate', to: 'items#create'
  resources :users
  resources :items
  resources :purchases, only: [:create, :index]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :items_search, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
