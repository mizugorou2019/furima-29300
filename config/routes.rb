Rails.application.routes.draw do

  root "items#index"
  resources :items, only: :index do
    resources :images, only: :create
  end
  resources :users, only: [:show, :index]
end
