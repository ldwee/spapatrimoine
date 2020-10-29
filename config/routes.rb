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
  get '/admin/activity_types', to: 'admin#activity_types', as: 'activity_types'
  get '/admin/activity_types_new', to: 'admin#activity_type_new', as: 'new_activity_type'
 post '/admin/activity_types', to: 'admin#activity_type_create'


end
