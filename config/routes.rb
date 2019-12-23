Rails.application.routes.draw do
  devise_scope :user do
    get 'users/sign_up', to: 'users/registrations#new'
    get 'users/sign_in', to: 'users/sessions#new'
  end
  devise_for :users

  root to: 'dashboard#index'

  resources :users, only: [] do
    resources :shifts, only: :index
  end

  resources :organisations, only: %i[edit update new create] do
    post :users, to: 'organisations/users#create'
    delete :user, to: 'organisations/users#destroy', as: :leave
  end
end
