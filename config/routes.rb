Rails.application.routes.draw do
  get 'lawyers/verify_oab', to: 'lawyers#verify_oab'

  devise_for :users
  root to: "pages#home"
  get "sobre", to: "about#sobre"
  get "adv", to: "about#adv"

  get "up", to: "rails/health#show", as: :rails_health_check

  resources :lawyers do
    collection do
      get 'search'
    end
    resources :connections, only: [:new, :create]
  end

  resources :connections, except: [:new, :create] do
    resources :payments, only: :new
  end

  resources :users, only: [:show, :new, :index, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
