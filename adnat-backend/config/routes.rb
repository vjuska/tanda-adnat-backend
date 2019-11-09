Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sign_up/index'
  get 'login/index'

  resources :users
  resources :organisations
  resources :employees
  resources :shifts

  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'organisations#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
