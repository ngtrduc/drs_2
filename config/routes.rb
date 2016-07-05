Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"}
  root "static_pages#home"
  resources :users, only: [:show, :edit, :update] do 
    resources :profiles, only: [:edit, :update]
  end
  resources :passwords, only: [:new, :create]
end
