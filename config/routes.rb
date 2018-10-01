Rails.application.routes.draw do
  resources :listings
  get '/', :to => 'listings#index'
  resources :bookings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
