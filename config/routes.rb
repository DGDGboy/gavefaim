Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # get "restaurants" => "restaurants#index"
  # get "restaurants/:id" => "restaurants#show"
  # get "restaurants/:new" => "restaurants#new"
  # post "restaurants" => "restaurants#create"
  # get "restaurants/:id/edit" => "restaurants#edit"
  # patch "restaurants/:id" => "restaurants#update"
  # delete "restaurants/:id" => "restaurants#restroy"

  resources :restaurants do

    resources :reviews, only: [:new, :create]

    collection do
      get :top
    end

    member do
      # get :chef # /restaurant/:id/chef par exemple
    end
  end
  resources :reviews, only: [:destroy]
  resources :contacts, only: [:new, :create]
end
