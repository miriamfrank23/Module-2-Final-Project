Rails.application.routes.draw do
  get 'sessions/new'
  resources :listings
  get '/', :to => 'listings#index'
  resources :bookings
  resources :users
  resources :reviews
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
