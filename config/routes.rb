Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  namespace :api do
    namespace :v1 do
      resources :users
      resources :stacks
      resources :payment_types

      namespace :auth, path: "/" do
        post "/login", to: "sessions#create"
      end
    end
  end
end
