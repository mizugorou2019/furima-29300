Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  resources :items, only: :index do
    resources :images, only: :create
  end
  resources :users, only: [:edit, :update, :destroy]
end
