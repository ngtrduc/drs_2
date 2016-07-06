Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  root "static_pages#home"

  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :profiles, only: :update
  end

  resources :users, except: [:destroy, :create, :new] do 
    resources :profiles, only: [:edit, :update]
  end
  resources :passwords, only: [:new, :create]
  resources :relationships, only: [:create, :destroy, :index]
end
