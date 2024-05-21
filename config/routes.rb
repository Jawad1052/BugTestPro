Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :admins
  devise_for :managers
  devise_for :users ,controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :bugs do
    resources :comments, only: [:create]
    member do
      patch 'assign_bug'
      delete 'delete_bug'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "bugs#index"
end
