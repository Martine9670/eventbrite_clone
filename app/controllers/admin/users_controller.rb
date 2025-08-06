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

  private

  def check_if_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.is_admin?
  end
end
