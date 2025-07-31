class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_event_owner, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path, notice: "Événement créé avec succès !"
    else
      flash.now[:alert] = "Erreur lors de la création de l'événement."
      render :new
    end
  end

  def show
    # @event est déjà défini par set_event
  end

  def edit
    # @event est déjà défini par set_event
  end

def update
  if @event.update(event_params)
    flash[:notice] = "Mise à jour réussie"
    redirect_to @event
  else
    flash.now[:alert] = @event.errors.full_messages.join(", ")
    render :edit
  end
end

def destroy
  @event = Event.find(params[:id])
  @event.destroy
  flash[:notice] = "Événement supprimé avec succès."
  redirect_to root_path
end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location, :image)
  end

  def set_event
    @event = Event.includes(:participants, :user).find(params[:id])
  end

  def authorize_event_owner
    unless @event.user == current_user
      flash[:alert] = "Tu n'es pas autorisé à modifier cet événement."
      redirect_to root_path
    end
  end

  def join
  @event = Event.find(params[:id])

    if @event.free?
      if @event.participations.exists?(user: current_user)
        flash[:alert] = "Tu participes déjà à cet événement."
      else
        @event.participations.create(user: current_user)
        flash[:notice] = "Tu as rejoint l’événement gratuitement ! 🎉"
      end
      redirect_to @event
    else
      # Rediriger vers Stripe ou autre paiement
      redirect_to new_event_payment_path(@event), alert: "Paiement requis pour rejoindre cet événement."
    end
  end
end