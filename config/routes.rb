Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'rankings/wish', to: 'rankings#wish'
  get 'rankings/review', to: 'rankings#review'
  
  resources :users, only: [:show, :new, :create]
  
  resources :attractions
  resources :wishes, only: [:create, :destroy]
  resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  
  
end
