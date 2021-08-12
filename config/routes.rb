Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'tops#index'
  resources :hotels, only: [:index, :create, :destroy]
end