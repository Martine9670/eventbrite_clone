# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

def update
  @user = current_user

  # Empêche d’écraser birthdate si non présent dans le formulaire
  safe_params = user_params
  safe_params[:birthdate] = @user.birthdate

  if @user.update(safe_params)
    redirect_to profile_path, notice: "Profil mis à jour avec succès."
  else
    flash.now[:alert] = "Impossible de mettre à jour votre profil."
    render :edit
  end
end

  def destroy
    current_user.destroy
    redirect_to root_path, alert: "Votre compte a été supprimé."
  end

  private

  def user_params
    # On autorise ici uniquement les infos modifiables sur la page profil
    params.require(:user).permit(:first_name, :last_name, :description, :email, :password, :password_confirmation)
  end
end
