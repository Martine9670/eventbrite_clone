class EventMailer < ApplicationMailer
  default from: 'no-reply@eventbriteclone.com'

  def event_rejected
    @event = params[:event]
    @user = @event.user

    mail(to: @user.email, subject: "❌ Votre événement a été refusé")
  end
end
