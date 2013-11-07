AptManager::Application.routes.draw do

  resources :pdfs


  resources :rentals

  root to: "rentals#index"
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions

  get "match", to: "rentals#match", as: 'match'
  post "create_match", to: "rentals#create_match", as: "create_match"
  get "matches", to: "rentals#matches", as: "matches"
  delete "matches/:user/:rental", to: "users#delete_match", as: "destroy_match"
  
end
