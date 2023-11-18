Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "user#index"
  root 'user#index'

  get '/user', to: 'user#index'
  get '/user/:id', to: 'user#show'
  get '/user/:author_id/post', to: 'post#index'
  get '/user/:author_id/post/:id', to: 'post#show'

end
