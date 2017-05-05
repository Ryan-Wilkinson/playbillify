class Ad < ApplicationRecord
	belongs_to :advertiser, class_name: :user, optional: true
	belongs_to :event
end
