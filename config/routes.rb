Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'tops#index'
  resources :hotels, only: [:show, :create, :destroy]
end