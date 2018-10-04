Rails.application.routes.draw do
  get 'sessions/new'
  get '/', :to => 'listings#index'
  get '/listings/deals', to: 'listings#deals'

  resources :listings
  resources :bookings
  resources :users
  resources :reviews
  resources :inquiries, only: [:new, :create]
  post '/bookings/new', to: 'bookings#new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
