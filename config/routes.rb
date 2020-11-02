Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/activités', to: 'activities#index', as: 'activities'
  get '/activités/new', to: 'activities#new'
  post '/activités', to: 'activities#create'
  get '/activités/:id/edit', to: 'activities#edit'
  get '/activités/:id', to: 'activities#show', as: 'activity'
  patch '/activités/:id', to: 'activities#update'
  
  get '/admin', to: 'admin#home'
  get '/admin/activités', to: 'admin#activities'


  get '/activity_types', to: 'activity_types#index'
  get '/activity_types/new', to: 'activity_types#new'
  post '/activity_types', to: 'activity_types#create'

  get '/activity_places', to: 'activity_places#index'
  get '/activity_places/new', to: 'activity_places#new'
  post '/activity_places', to: 'activity_places#create'


end
