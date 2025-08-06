class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :check_if_admin

  def index; end

  private

  def check_if_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.is_admin?
  end
end
