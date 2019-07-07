Rails.application.routes.draw do
  root            to: 'top_pages#home'
  get '/about',   to: 'top_pages#about'
  get '/signup',  to: 'users#new'
  post '/singup', to: 'users#create'
  resources :users
end
