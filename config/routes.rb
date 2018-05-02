Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  get 'registration-sign-in', to: 'pages#registration_sign_in', as: :registration_sign_in
  root to: 'pages#index'
end
