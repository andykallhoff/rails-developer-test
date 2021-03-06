Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :admin do
    resources :users
  end

  resources :articles

  get 'registration-sign-in', to: 'pages#registration_sign_in', as: :registration_sign_in
  root to: 'pages#index'
end
