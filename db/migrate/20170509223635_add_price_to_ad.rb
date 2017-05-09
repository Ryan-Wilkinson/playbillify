class AddPriceToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :price, :integer
  end
end
