class Organization < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :ads

  has_attached_file :logo, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>'}

  # Validate the attached logo is logo/jpg, logo/png, etc
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
