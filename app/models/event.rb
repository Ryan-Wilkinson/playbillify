class Event < ApplicationRecord
  has_many :ads, dependent: :destroy
  belongs_to :organization
  delegate :user, :to => :organization

  has_attached_file :event_image, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>'}

  # Validate the attached event_image is event_image/jpg, event_image/png, etc
  validates_attachment_content_type :event_image, :content_type => /\Aimage\/.*\Z/
end

