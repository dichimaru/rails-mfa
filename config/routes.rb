Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i(new create destroy)
  root   'top#index'
  get    '/welcome', to: 'sessions#new',     as: :welcome
  post   '/login',   to: 'sessions#create',  as: :login
  delete '/logout',  to: 'sessions#destroy', as: :logout
  resource :user_mfa_session, only: %i(new create)
end
