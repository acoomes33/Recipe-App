Rails.application.routes.draw do
  root "sessions#welcome"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  post "/signout" => "sessions#destroy"
  get "/signup" => "users#new"

  resources :ingredient_recipes
  resources :comments
  resources :ingredients
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
