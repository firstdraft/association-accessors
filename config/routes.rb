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
  root to: "ideas#index"
  resources :ideas
  resources :associations, only: [:new, :create, :destroy, :edit, :show] do
    resources :steps, only: [:show, :update], controller: 'associations/steps'
  end
  devise_for :users
  resources :models, except: :index
end
