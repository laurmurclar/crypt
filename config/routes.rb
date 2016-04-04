Rails.application.routes.draw do
  devise_for :users

  root to: "user#home"

  resources :groups
  resources :members, only: [:index, :new, :create]

end
