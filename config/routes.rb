Rails.application.routes.draw do
  get 'lawyers/verify_oab', to: 'lawyers#verify_oab'

  devise_for :users

  root to: "pages#home"
  get "sobre", to: "about#sobre"
  get "adv", to: "about#adv"


  resources :lawyers
end
