Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  get '/users/:id', to:'users#show'

  get '/problems/new', to:'problems#new'
end
