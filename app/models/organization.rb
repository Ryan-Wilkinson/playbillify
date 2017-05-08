class Organization < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :ads
  after_initialize :set_defaults, unless: :persisted?
  def set_defaults
    self.photo_url ||= '#'
  end
end
