Rails.application.routes.draw do
  devise_for :users

  get 'sign-in', to: 'pages#sign_in_register', as: :sign_in
  get 'register', to: 'pages#sign_in_register', as: :register
  root to: 'pages#index'
end
