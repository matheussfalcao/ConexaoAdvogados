# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  get 'welcome', to: 'pages#welcome', as: 'welcome'
  get 'pending_confirmation', to: 'pages#pending_confirmation', as: 'pending_confirmation'
  get 'privacy', to: 'pages#privacy', as: 'privacy'

  # Rotas para confirmação de email
  get 'email_confirmation/confirm', to: 'email_confirmation#confirm', as: 'confirm_email'
  post 'email_confirmation/send_confirmation_email_request', to: 'email_confirmation#send_confirmation_email_request'

  # Rota raiz
  root to: 'pages#home'
end
