Rails.application.routes.draw do
  resource :user, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
end
