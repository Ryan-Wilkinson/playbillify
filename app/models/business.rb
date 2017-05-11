class Business < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ads, through: :user


  VALID_PHONE_NUMBER_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
  validates :business_phone, presence: true, length: {maximum: 15}, format: { with: VALID_PHONE_NUMBER_REGEX }

end
