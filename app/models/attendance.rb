class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :stripe_customer_id_required_if_paid

  def stripe_customer_id_required_if_paid
    if !event.free? && stripe_customer_id.blank?
      errors.add(:stripe_customer_id, "doit être présent pour les événements payants")
    end
  end

  after_create :notify_event_creator

  def notify_event_creator
    AttendanceMailer.new_attendance_email(self).deliver_now
  end
end
