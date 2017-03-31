Rails.application.routes.draw do
  devise_for :users
  resources :tickets

  get '/tickets/search/:q', to: 'tickets#search', as: :search

  root 'tickets#index'
end
