class Ad < ApplicationRecord
	# belongs_to :advertiser, class_name: :user, optional: true, :foreign_key => "advertiser_id"
	belongs_to :advertiser, :class_name => "User"
	belongs_to :event

	# This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: { thumb: '100x100>', square: '200x200#', medium: '300x300>'}

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
