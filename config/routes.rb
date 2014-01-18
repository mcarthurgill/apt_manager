AptManager::Application.routes.draw do

  resources :links


  resources :payments


  resources :dummies


  resources :bg_images


  resources :faqs


  resources :maintenance_requests


  root to: "home#index"

  get "home/index"
  resources :pdfs
  resources :rentals

  resources :users
  get "users/:id/payments", to: "users#payments", as: 'user_payments'
  get "users/:id/pay_rent", to: "users#pay_rent", as: 'pay_rent'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions

  get "match", to: "rentals#match", as: 'match'
  post "create_match", to: "rentals#create_match", as: "create_match"
  get "matches", to: "rentals#matches", as: "matches"
  delete "matches/:user/:rental", to: "users#delete_match", as: "destroy_match"
  
end
