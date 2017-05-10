class AddLogoToOrganization < ActiveRecord::Migration[5.0]
	def up
	  add_attachment :organizations, :logo
	end
end
