Rails.application.routes.draw do
  use_doorkeeper
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      get "/current_user" => "users#show"

      resources :ideas

      resources :associations

      resources :users

      resources :models
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "models#index"
  resources :ideas
  resources :associations
  devise_for :users
  resources :users
  resources :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
