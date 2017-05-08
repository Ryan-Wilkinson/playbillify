class AddImageToAd < ActiveRecord::Migration[5.0]
	def up
	  add_attachment :ads, :image
	end
end
