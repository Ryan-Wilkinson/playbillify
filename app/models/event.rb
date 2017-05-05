class Event < ApplicationRecord
  has_many :ads, dependent: :destroy
  belongs_to :organization
end
