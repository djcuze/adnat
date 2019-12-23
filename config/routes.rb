Rails.application.routes.draw do
  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new'
    get 'users/sign_in', to: 'users/sessions#new'
  end
  devise_for :users

  root to: 'dashboard#index'

  resources :organisations, only: %i[edit update new create]
end
