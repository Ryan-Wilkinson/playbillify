class AddIsAdvertiserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_advertiser, :boolean
  end
end
