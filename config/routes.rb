Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "models#index"
  resources :ideas
  resources :indirect_associations
  resources :direct_associations
  devise_for :users
  resources :users
  resources :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
