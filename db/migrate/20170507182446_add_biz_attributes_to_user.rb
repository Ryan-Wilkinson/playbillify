class AddBizAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :business_name, :string
    add_column :users, :business_street1, :string
    add_column :users, :business_street2, :string
    add_column :users, :business_city, :string
    add_column :users, :business_state, :string
    add_column :users, :business_phone, :string
  end
end
