Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  # get 'items/new', to: 'items#tax'
  resources :items

  resources :users, only: [:edit, :update, :destroy]
end
