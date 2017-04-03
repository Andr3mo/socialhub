Rails.application.routes.draw do
  get 'about/index'

  get 'contact' => 'contact#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'

  devise_for :users
  resources :tickets
  resources :users

  get '/tickets/search/:q', to: 'tickets#search', as: :search

  root 'tickets#index'
end
