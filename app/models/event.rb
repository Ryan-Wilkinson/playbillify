class Event < ApplicationRecord
  has_many :ads, dependent: :destroy
  belongs_to :organization
  delegate :user, :to => :organization
end
