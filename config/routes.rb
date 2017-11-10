Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index] 
  resource :session, only: [:create, :destroy, :new]
  resources :goals, only: [:show]
  resources :comments, only: [:create]
end
