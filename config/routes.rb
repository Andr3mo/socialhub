Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  resources :tickets
  resources :users

  get '/tickets/search/:q', to: 'tickets#search', as: :search

  root 'tickets#index'
end
