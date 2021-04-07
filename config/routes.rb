Rails.application.routes.draw do
  resources :attractions
  resources :titles
  resources :categories
  resources :user, only: [:show, :update, :edit]
  devise_for :users
  get 'home/index'
  root 'attractions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
