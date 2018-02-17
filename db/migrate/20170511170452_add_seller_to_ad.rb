class AddSellerToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :address, :string
  end
end
