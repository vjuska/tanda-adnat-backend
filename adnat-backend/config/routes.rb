Rails.application.routes.draw do
  get 'sign_up/index'
  get 'login/index'

  resources :users
  resources :organisations
  resources :employees
  resources :shifts

  root 'login#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
