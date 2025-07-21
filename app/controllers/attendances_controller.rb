# app/controllers/attendances_controller.rb
class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

def create
  # On vérifie si l'utilisateur est déjà inscrit à cet événement
  if @event.participants.include?(current_user)
    redirect_to @event, alert: "Tu es déjà inscrit à cet événement."
    return
  end

  @attendance = Attendance.new(user: current_user, event: @event)
  @attendance.stripe_customer_id = "cus_mock_#{SecureRandom.hex(8)}"

  if @attendance.save
    redirect_to root_path, notice: "Inscription à l'événement réussie ! Un mail a été envoyé au créateur."
  else
    flash.now[:alert] = "Erreur lors de l'inscription à l'événement."
    render :new
  end
end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
