class AddSellersArrayToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :sellers, :string, array: true
  end
end
