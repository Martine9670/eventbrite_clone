class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true

  after_create :notify_event_creator

  def notify_event_creator
    AttendanceMailer.new_attendance_email(self).deliver_now
  end
end
