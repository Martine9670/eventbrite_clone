class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event

  validates :birthdate, presence: true, on: :create
  validate :must_be_at_least_18

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
private

  def must_be_at_least_18
    return if birthdate.blank?

    if birthdate > 18.years.ago.to_date
      errors.add(:birthdate, "Tu dois avoir au moins 18 ans pour t'inscrire.")
    end
  end
end
