class Event < ApplicationRecord
  has_many :ads, dependent: :destroy
  belongs_to :organization
  delegate :user, :to => :organization
  # validate :dates_cannot_be_in_the_past

  # def dates_cannot_be_in_the_past
  #   if start_date.present? && end_date < Date.today
  #     errors.add(:start_date, "can't be in the past")
  #   end
  # end
end

