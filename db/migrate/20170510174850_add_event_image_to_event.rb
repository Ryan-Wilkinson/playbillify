class AddEventImageToEvent < ActiveRecord::Migration[5.0]
	def up
	  add_attachment :events, :event_image
	end
end
