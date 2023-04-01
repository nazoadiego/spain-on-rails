Rails.application.routes.draw do
  root 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'pages/home'
  get 'pages/export'
  get 'pages/export/companies', to: 'pages#csv'
  resources :companies do
    resources :comments
  end

  namespace :admin do
    resources :users
    resources :companies

    root to: 'users#index'
  end
end
