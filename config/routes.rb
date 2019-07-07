Rails.application.routes.draw do
  
  get '/' ,to: 'top_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'top_pages#about'
  get '/signup', to: 'users#new'
end
