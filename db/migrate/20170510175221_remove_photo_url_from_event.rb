class RemovePhotoUrlFromEvent < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events, :photo_url
  end
end
