Rails.application.routes.draw do
  root 'tops#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :hotels, only: [:index, :create, :destroy] do
    collection do
      get "map"
    end
  end
end