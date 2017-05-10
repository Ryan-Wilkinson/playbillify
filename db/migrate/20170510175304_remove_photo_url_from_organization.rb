class RemovePhotoUrlFromOrganization < ActiveRecord::Migration[5.0]
  def change
  	remove_column :organizations, :photo_url
  end
end
