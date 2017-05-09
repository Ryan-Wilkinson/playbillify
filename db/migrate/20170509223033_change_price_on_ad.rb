class ChangePriceOnAd < ActiveRecord::Migration[5.0]
  def change
    remove_column :ads, :price, :float
  end
end



