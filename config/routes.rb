Rails.application.routes.draw do
  get 'users/new'
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"

  resources :users, only: [ :show ] do
    get 'outfits', to: "users#outfits"
    get 'requests', to: "users#requests"
  end

  resources :outfits, only: [ :new, :create, :show, :index, :destroy ]

  resources :outfits do
    resources :requests, only: [ :new, :create, :edit, :update, :destroy ]
  end

  resources :requests, only: [ :edit, :update ]
end
