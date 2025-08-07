class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

    def index
        @events = Event.all.order(created_at: :desc)
    end

    def pending
        @events = Event.where(reviewed: false)
    end

    def validate
        @event = Event.find(params[:id])
        @event.update(validated: true, reviewed: true)
        redirect_to validated_admin_events_path, notice: "✅ Événement validé !"
    end

    
    def reject
        @event = Event.find(params[:id])
        @event.update(validated: false, reviewed: true)
    
        # Envoi de l'e-mail
        EventMailer.with(event: @event).event_rejected.deliver_now

        redirect_to pending_admin_events_path, alert: "❌ Événement refusé et email envoyé à l'organisateur."
    end

    def destroy
        @event = Event.find(params[:id])
        if @event.destroy
            redirect_to admin_events_path, notice: "🗑️ Événement supprimé avec succès."
        else
            redirect_to admin_events_path, alert: "❌ Impossible de supprimer l'événement."
        end
    end

    def past
        @events = Event.where("start_date < ?", Date.today).order(start_date: :desc)
    end


  private

    def check_if_admin
        redirect_to root_path, alert: "Accès réservé aux admins" unless current_user.is_admin?
    end
end
