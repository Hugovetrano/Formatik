Rails.application.routes.draw do
  devise_for :users
  root to: "sessions#index"

  resources :entreprises
  resources :apprenants
  resources :intervenants
  resources :sessions, as: :sessions_formation
  resources :programmes
  resources :parcoursadmins, except: %i[new edit destroy]
  resources :inscriptions

  get "/mesdonnees" , to: "pages#mesdonnees"

  get "/getProgDetails/:id", to: "programmes#getDetails", as: :getProgDetails
end
