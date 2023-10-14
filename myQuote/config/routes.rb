Rails.application.routes.draw do
  # get 'about/index'
  # get 'home/index'
  root 'home#index'
  get '/about', to: 'about#index'
  resources :quotes
  resources :categories
  resources :sources
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
