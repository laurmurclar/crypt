Rails.application.routes.draw do
  devise_for :users

  root to: "user#home"

  resources :groups
  resources :members, only: [:index, :new, :create]
  resources :edocs, only: [:index, :new, :create, :show]
  get '/edocs/:id/download', to: 'edocs#download', as: 'edoc_download'
end
