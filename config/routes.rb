Rails.application.routes.draw do
  root "sessions#welcome"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get '/auth/:google_oauth2/callback' => 'sessions#google'

  get '/recipes/search', to:'recipes#search'
  post '/search', to:'recipes#results'

  resources :comments
  resources :ingredients
  resources :recipes
  resources :users
  
  resources :recipes do
    resources :comments
  end
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
