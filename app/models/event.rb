class Event < ApplicationRecord
  has_many :ads
  belongs_to :organization
end
