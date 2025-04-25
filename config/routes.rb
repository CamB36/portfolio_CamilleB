Rails.application.routes.draw do
  # Routes existantes
  resources :competences
  get 'admin_sessions/new'
  get 'admin_sessions/create'
  get 'admin_sessions/destroy'
  resources :experiences
  resources :formations
  
  root to: 'pages#accueil'
  get '/accueil', to: 'pages#accueil'

  # Categories routes
  resources :categories, only: [:new, :create, :index]

  # Formations routes
  resources :formations
  get '/formations', to: 'formations#index'
  get '/formations/edit/:id', to: 'formations#edit'
  get '/formations/show/:id', to: 'formations#show'
  
  # Experiences routes
  resources :experiences
  get '/experiences', to: 'experiences#index'
  get '/experiences/edit/:id', to: 'experiences#edit'

  # Competences routes
  resources :competences
  get '/competences', to: 'competences#index'
  get '/competences/edit/:id', to: 'competences#edit'

  # Admin routes
  get '/3700036270', to: 'admin_sessions#new', as: :login
  post '/3700036270', to: 'admin_sessions#create'
  delete '/logout', to: 'admin_sessions#destroy', as: :logout

  # Projets routes
  resources :projets do
    post :filter, on: :collection  # Cette ligne doit être à l'intérieur du bloc
  end
  get '/projets', to: 'projets#index'
  get '/projets/edit/:id', to: 'projets#edit'
  get '/projets/show/:id', to: 'projets#show'

  # Pages statiques
  get '/veille', to: 'pages#veille'
  get '/confidentialite', to: 'pages#confidentialite'
  get '/contact', to: 'pages#contact'
  get '/credits', to: 'pages#credits'
  
  # Documents routes
  get 'documents/:id', to: 'documents#show'
end