Rails.application.routes.draw do
  get 'users/new'
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"

  resources :outfits, only: [ :new, :create, :show, :index ]

  resources :outfits do
    resources :requests, only: [ :new, :create, :edit ]
  end

  resources :requests, only: [ :index ]
end
