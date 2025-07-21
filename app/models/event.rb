class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances, source: :user

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_multiple_of_5

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if start_date.present? && start_date < Time.now
  end

  def duration_multiple_of_5
    errors.add(:duration, "must be a multiple of 5") if duration.present? && duration % 5 != 0
  end
end
