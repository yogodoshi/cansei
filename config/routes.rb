Rails.application.routes.draw do
  root to: 'users#new'
  get '/editar', to: 'users#edit', as: :edit_user
  patch '/editar', to: 'users#update'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/sair', to: 'sessions#destroy', as: :logout
end
