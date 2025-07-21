class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-clone.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue sur notre Eventbrite clone !')
  end
end
