Rails.application.routes.draw do
  root               to: 'top_pages#home'
  get '/about',      to: 'top_pages#about'
  get '/signup',     to: 'users#new'
  post '/singup',    to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :dvds,   only: [:create, :destroy]
end
