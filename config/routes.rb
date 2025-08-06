Rails.application.routes.draw do
namespace :admin do
  root to: "dashboard#index"
  get 'dashboard', to: 'dashboard#index'
  resources :users, only: [:index, :update, :destroy]
end

  # Page d'accueil
  root to: "pages#home"

  # Authentification avec Devise
  devise_for :users

  # Profil utilisateur
  resource :profile, only: [:show, :edit, :update, :destroy]

  # Événements
resources :events do
  post 'checkout', on: :member, to: 'checkout#create'
  get 'attendance_success', on: :member, to: 'attendances#success'
  post 'join', on: :member
end

  # Test de santé Rails
  get "up" => "rails/health#show", as: :rails_health_check

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

end


