Rails.application.routes.draw do
  devise_for :users

  root to: "user#home"

  resources :groups
  get '/groups/:id/new_member', to: 'groups#new_member', as: 'new_member'
  post '/groups/:id/create_member', to: 'groups#create_member', as: 'create_member'
  get '/groups/:id/members', to: 'groups#members', as: 'members'

end
