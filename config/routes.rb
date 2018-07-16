Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'blog', to: 'pages#blog'
  get 'be-of-service', to:'pages#be_of_service'
  get 'groups', to: 'pages#groups'
  get 'give', to: 'pages#give'
  get 'who-we-are', to: 'pages#who_we_are'
  get 'venue', to: 'pages#venue'
  get 'youth', to: 'pages#youth'

  resources :events, only: [:index]
  resources :groups, only: [:index]
  resources :prayer_requests, only: [:new, :create, :edit]
end
