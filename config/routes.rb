Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
