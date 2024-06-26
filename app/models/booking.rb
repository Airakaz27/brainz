class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :brain

  validates :start_date, presence: true
  validates :end_date, presence: true

  enum status: { pending: "pending", accepted: "approved", rejected: "rejected" }

  # validate :end_date_after_start_date
  # validate :start_date_not_in_past

  # private

  # def end_date_after_start_date
  #   return if end_date.blank? || start_date.blank?

  #   errors.add(:end_date, "must be after the start date") if end_date < start_date
  # end

  # def start_date_not_in_past
  #   errors.add(:start_date, "can't be in the past") if start_date < Date.today
  #   errors.add(:end_date, "can't be in the past") if end_date < Date.today
  # end
end
