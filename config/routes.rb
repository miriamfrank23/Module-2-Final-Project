Rails.application.routes.draw do
  resources :listings, only: [:show, :new, :create, :edit, :update, :destroy]
  get '/', :to => 'listings#index'
  resources :bookings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
