class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:id])

    if event.participants.include?(current_user)
      redirect_to event, alert: "Tu es déjà inscrit à cet événement."
      return
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: { name: event.title },
          unit_amount: (event.price * 100).to_i,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: attendance_success_event_url(event),
      cancel_url: root_url + "?canceled=true",
      customer_email: current_user.email,
    )

    redirect_to session.url, allow_other_host: true
  end
end
