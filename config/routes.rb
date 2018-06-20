Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:index]
  resources :groups, only: [:index]
  resources :prayer_requests, only: [:new, :create, :edit]
end
