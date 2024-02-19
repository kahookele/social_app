Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Create account (registration)
  resources :registration, only: [:new, :create]

  # Login (session)
  resources :session, only: [:new, :create]

  # Home page (home)
  resources :home, only: [:index, :destroy]

  # Posts
  resources :posts, only: [:new, :create]
end
