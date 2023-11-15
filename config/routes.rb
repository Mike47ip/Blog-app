
Rails.application.routes.draw do
  devise_for :users
  get 'likes/create'
  # Defines the root path route ("/")
  # root "user#index"
  root 'user#index'

  get '/user', to: 'user#index'
  get '/user/:id', to: 'user#show'
  get '/user/:id/post', to: 'post#index', as: 'post'
  get '/user/:id/post/new', to: 'post#new'
  get '/user/:id/post/:id', to: 'post#show'
  post '/user/:id/post/create', to: 'post#create'
  get '/user/:id/post/:post_id/comments/new', to: 'comments#new'
  post '/user/:id/post/:post_id/comments/create', to: 'comments#create'
  post '/user/:id/post/:post_id/likes', to: 'post#likes', as: 'likes'
  post '/user/:id/post/:post_id/likes/create', to: 'likes#create'
end
