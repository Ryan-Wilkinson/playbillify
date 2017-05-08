class Business < ApplicationRecord
  belongs_to :user, optional: true
  has_many :ads, through: :user
end
