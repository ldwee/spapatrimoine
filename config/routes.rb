Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/activités', to: 'activities#index', as: 'activities'
  get '/activités/new', to: 'activities#new'
  post '/activités', to: 'activities#create'
  get '/admin', to: 'admin#home'


end
