Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"

  get '/outfits', to: 'outfits#index'
  get '/outfits/:id', to: 'outfits#show'

  get '/outfits/new', to: 'outfits#new'
  post 'outfits', to: 'outfits#create'

  resources :users do
    resources :outfits, only: [ :new, :create, :destroy ]
  end
end
