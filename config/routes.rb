Rails.application.routes.draw do
  get 'about' => 'about#index'

  get 'contact' => 'contact#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'

  devise_for :users
  resources :tickets
  resources :users
  resources :searches

  get '/tickets/search/:q', to: 'tickets#search', as: :simple_search

  root 'tickets#index'
end
