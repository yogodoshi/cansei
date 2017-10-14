Rails.application.routes.draw do
  root to: 'users#new'

  get '/auth/:provider/callback', to: 'sessions#create'
end
