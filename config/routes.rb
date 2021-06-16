Rails.application.routes.draw do
  resources :bookings
  get 'static_pages/about'
  get 'static_pages/contact'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :attractions
  resources :titles
  resources :categories
  resources :user, only: [:show, :update, :edit]
  devise_for :users
  get 'home/index'
  root 'attractions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
