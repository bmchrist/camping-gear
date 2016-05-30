Rails.application.routes.draw do
  get 'app', to: 'dashboard#index'
  get 'app/*other', to: 'dashboard#index'

  resources :items, only: [:index, :create, :destroy, :update]
  resources :trips, only: [:index, :create]
end
