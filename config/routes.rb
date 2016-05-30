Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :items, only: [:index, :create, :destroy, :update]
  resources :trips, only: [:index]
end
