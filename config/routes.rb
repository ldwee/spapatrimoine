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
  delete '/activités/:id', to: 'activities#destroy'
  
  get '/admin', to: 'admin#home'
  get '/admin/activités', to: 'admin#activities'
  get '/admin/actualités', to: 'admin#actualities'


  get '/activity_types', to: 'activity_types#index'
  get '/activity_types/new', to: 'activity_types#new'
  post '/activity_types', to: 'activity_types#create'

  #get '/activity_places', to: 'activity_places#index'
  #get '/activity_places/new', to: 'activity_places#new'
  #post '/activity_places', to: 'activity_places#create'

  Rails.application.routes.draw do
    resources :activity_places
  end

  Rails.application.routes.draw do
    resources :activity_types
  end

  get '/actualités', to: 'actualities#index', as: 'actualities'
  get '/actualités/new', to: 'actualities#new'
  post '/actualités', to: 'actualities#create'
  get '/actualités/:id/edit', to: 'actualities#edit'
  get '/actualités/:id', to: 'actualities#show', as: 'actuality'
  patch '/actualités/:id', to: 'actualities#update'
  delete '/actualités/:id', to: 'actualities#destroy'

  Rails.application.routes.draw do
    resources :themes
  end

end
