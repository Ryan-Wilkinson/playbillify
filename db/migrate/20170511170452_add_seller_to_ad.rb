class AddSellerToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :seller, :string
  end
end
