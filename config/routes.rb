Rails.application.routes.draw do
  root "sessions#welcome"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get '/auth/:google_oauth2/callback' => 'sessions#google'

  get '/recipes/:recipe_id/ingredient/new', to: 'ingredients#new'
  post '/recipes/:recipe_id/ingredients', to: 'ingredients#create'


  resources :comments
  resources :ingredients
  resources :recipes
  resources :users
  resources :recipes do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
