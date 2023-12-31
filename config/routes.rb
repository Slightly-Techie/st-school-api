Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  namespace :api do
    namespace :v1 do
      resource :users
      resources :stacks
      resources :payment_types
      resources :certificates
      resources :user_comments, only: [:index, :create]
      resources :payments

      namespace :auth, path: "/" do
        post "/login", to: "sessions#create"
      end

      post "/forgot-password", to: "passwords#create"
      post "/reset-password", to: "passwords#update", as: :reset_password
    end
  end
end
