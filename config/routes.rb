Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"

  get "/entreprises/getentreprises", to: 'entreprises#getentreprises'
  resources :entreprises
  resources :apprenants
  post '/apprenants/update_by_mail', to: 'apprenants#update_by_mail'
  resources :intervenants
  resources :sessions, as: :sessions_formation
  get "/programmes/getprogrammes", to: 'programmes#getprogrammes'
  resources :programmes
  resources :parcoursadmins, except: %i[new edit destroy]
  resources :inscriptions

  get "/mesdonnees", to: "pages#mesdonnees"

  get "/getProgDetails/:id", to: "programmes#getDetails", as: :getProgDetails

  get "preinscriptions", to: "pre_inscriptions#index", as: :pre_inscriptions
  get "/preinscriptions/sessions", to: "pre_inscriptions#indexsessions", as: :pre_inscriptions_index_sessions
  get "/preinscriptions/sessions/:session_id", to: "pre_inscriptions#new", as: :new_pre_inscriptions
  get "/preinscriptions/:id", to: "pre_inscriptions#confirmation", as: :pre_inscription_confirmation
  get "sessions/:session_id/preinscriptions", to: "pre_inscriptions#index_par_session", as: :session_pre_inscriptions
  get "sessions/:session_id/preinscriptions/:id", to: "pre_inscriptions#show", as: :pre_inscription
  post "/preinscriptions/sessions/:session_id", to: "pre_inscriptions#create", as: :create_pre_inscriptions
  get '/pre_inscription/check_preinscriptions', to: 'pre_inscriptions#check_preinscription'

end
