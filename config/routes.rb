Rails.application.routes.draw do
  # Page d'accueil
  root to: "pages#home"

  # Authentification avec Devise
  devise_for :users

  # Profil utilisateur
  resource :profile, only: [:show, :edit, :update, :destroy]

  # Événements
  resources :events do
    # Inscriptions à un événement
    resources :attendances, only: [:new, :create]
  end

  # Test de santé Rails
  get "up" => "rails/health#show", as: :rails_health_check
end
