Rails.application.routes.draw do
  devise_for :users
  root to: "sessions#index"

  resources :entreprises
  resources :apprenants
  post '/apprenants/update_by_mail', to: 'apprenants#update_by_mail'
  resources :intervenants
  resources :sessions, as: :sessions_formation
  resources :programmes
  resources :parcoursadmins, except: %i[new edit destroy]
  resources :inscriptions

  get "/mesdonnees", to: "pages#mesdonnees"

  get "/getProgDetails/:id", to: "programmes#getDetails", as: :getProgDetails

  get "/preinscriptions/sessions", to: "pre_inscriptions#indexsessions", as: :pre_inscriptions_index_sessions
  get "/preinscriptions/sessions/:session_id", to: "pre_inscriptions#new", as: :new_pre_inscriptions
  get "/preinscriptions/:id", to: "pre_inscriptions#confirmation", as: :pre_inscription_confirmation
  get "sessions/:session_id/preinscriptions", to: "pre_inscriptions#index_par_session", as: :session_pre_inscriptions
  get "sessions/:session_id/preinscriptions/:id", to: "pre_inscriptions#show", as: :pre_inscription
  post "/preinscriptions/sessions/:session_id", to: "pre_inscriptions#create", as: :create_pre_inscriptions
end
