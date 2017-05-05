class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :size
      t.float :price
      t.integer :advertiser_id
      t.integer :event_id
      t.string :photo_url
      t.string :dimensions

      t.timestamps
    end
  end
end
