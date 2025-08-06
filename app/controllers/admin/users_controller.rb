class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :check_if_admin

  def index
    @users = User.all.order(:email)
  end

  def update
    user = User.find(params[:id])
    user.update(is_admin: !user.is_admin?)
    redirect_to admin_users_path, notice: "Mise à jour OK"
  end

   def destroy
    user = User.find(params[:id])
    if user == current_user
      redirect_to admin_users_path, alert: "Tu ne peux pas te supprimer toi-même !"
    elsif user.is_admin?
      redirect_to admin_users_path, alert: "Impossible de supprimer un admin pour des raisons de sécurité."
    else
      user.destroy
      redirect_to admin_users_path, notice: "Utilisateur supprimé ✅"
    end
  end


  private

  def check_if_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.is_admin?
  end
end
