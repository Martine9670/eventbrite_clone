class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def success
    if @event.participants.include?(current_user)
      redirect_to @event, alert: "Tu es déjà inscrit à cet événement."
      return
    end

    attendance = Attendance.new(user: current_user, event: @event)
    attendance.stripe_customer_id = "cus_#{SecureRandom.hex(8)}" # Optionnel

    if attendance.save
      redirect_to @event, notice: "Paiement réussi, tu es inscrit !"
    else
      redirect_to @event, alert: "Erreur lors de l'enregistrement après paiement."
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
