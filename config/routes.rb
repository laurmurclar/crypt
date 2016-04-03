Rails.application.routes.draw do
  devise_for :users

  root to: "user#home"

  resources :groups
  get '/groups/:id/member', to: 'groups#new_member', as: 'new_member'
  post '/groups/:id/member', to: 'groups#create_member', as: 'create_member'
  delete '/groups/:id/member', to: 'groups#remove_member', as: 'remove_member'
  get '/groups/:id/members', to: 'groups#members', as: 'members'

end
