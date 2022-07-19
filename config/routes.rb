# frozen_string_literal:true

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get '/signup', to: 'users#new', as: 'signup'
  get 'static_pages/home'
  get '/help', to: 'static_pages#help', as: 'help' # also check in test/controller/static_page_controller_test.rb
  get 'static_pages/about', as: 'about'
  get 'static_pages/contact', as: 'contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :microposts, only: %i[create destroy]
  # root'applicaion#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
