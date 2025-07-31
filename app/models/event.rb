class Event < ApplicationRecord
  belongs_to :user
   has_one_attached :image
  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances, source: :user

  validates :start_date, presence: true
  validate :start_date_must_be_in_future

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_multiple_of_5

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  def free?
    price == 0
  end

  private

  def start_date_must_be_in_future
    return if start_date.blank?

    if start_date.to_date < Date.current
      errors.add(:start_date, "doit être aujourd'hui ou dans le futur")
    end
  end

  def duration_multiple_of_5
    errors.add(:duration, "must be a multiple of 5") if duration.present? && duration % 5 != 0
  end
end
