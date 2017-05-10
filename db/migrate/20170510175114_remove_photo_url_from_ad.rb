class RemovePhotoUrlFromAd < ActiveRecord::Migration[5.0]
  def change
  	remove_column :ads, :photo_url
  end
end
