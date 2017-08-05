Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  get '/users/:id', to:'users#show'

  resources :problems
  get  '/problems/', to:'problems#index'
  get  '/problems/:id', to:'problems#show'
  get  '/problems/new', to:'problems#new'
  post '/problems/create', to:'problems#create'

end
