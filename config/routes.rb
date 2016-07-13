Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations"}
  root "static_pages#home"

  namespace :admin do
    root "dashboard#index"
    resources :users, only: [:index, :show, :destroy]
    resources :profiles, only: :update
    resources :positions, except: :new
    resources :divisions, except: :new
  end

  resources :users, except: [:destroy, :create, :new] do
    resources :profiles, only: [:edit, :update]
  end
  resources :passwords, only: [:new, :create]
  resources :relationships, only: [:create, :destroy, :index]
  resources :requests, only: [:new, :create]
end
