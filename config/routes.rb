Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  namespace :api do
    namespace :v1 do
      resource :users
      resources :stacks
      resources :payment_types
      get 'certificates', to: 'certificates#show'

      namespace :auth, path: "/" do
        post "/login", to: "sessions#create"
      end
    end
  end
end
