
Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:new, :create, :show, :index] 
  resource :session, only: [:create, :destroy, :new]
  resources :goals, only: [:show]
  resources :comments, only: [:create]
end
