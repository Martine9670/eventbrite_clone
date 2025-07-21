class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-clone.com'

  def new_attendance_email(attendance)
    @event = attendance.event
    @admin = @event.user
    @participant = attendance.user
    mail(to: @admin.email, subject: "#{@participant.first_name} participe à votre événement !")
  end
end
