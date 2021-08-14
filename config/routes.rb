Rails.application.routes.draw do
  root 'tops#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post "/users/guest_sign_in", to: "users/sessions#new_guest"
  end

  resources :hotels, only: [:index, :create, :destroy] do
    collection do
      get "map"
    end
  end
end