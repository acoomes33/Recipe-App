Rails.application.routes.draw do
  root "sessions#welcome"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  get "signup", to: "users#new"

  resources :ingredient_recipes
  resources :comments
  resources :ingredients
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
