class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Pour l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthdate])
    
    # Pour l'édition du compte
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthdate])
  end
end
