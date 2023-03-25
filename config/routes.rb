Rails.application.routes.draw do
  root 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'pages/home'
  resources :companies

  namespace :admin do
    resources :users
    resources :companies

    root to: 'users#index'
  end
end
