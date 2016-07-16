Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"}
  root "static_pages#home"

  namespace :admin do
    root "dashboard#index"
    resources :users, only: [:index, :show, :destroy]
    resources :profiles, only: :update
    resources :positions, except: :new
    resources :divisions, except: :new
    resources :progesses, except: [:new, :show]
    resource :charts do
      collection {get :index}
    end
  end

  resources :users, except: [:destroy, :create, :new] do
    resources :profiles, only: [:edit, :update]
  end
  resources :passwords, only: [:new, :create]
  resources :relationships, only: [:create, :destroy, :index]
  resources :requests, except: :show
  resources :divisions, only: [:show, :update]
  resources :reports, except: :show
end
