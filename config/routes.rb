Rails.application.routes.draw do
  devise_for :users
  root to: "pages#dashboard"

  resources :entreprises
  resources :apprenants
  resources :intervenants
  resources :sessions
  resources :programmes
  resources :parcoursadmins, except: [:new, :edit, :destroy]
  resources :inscriptions
end
