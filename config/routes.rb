# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get 'about', to: 'pages#about'
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
