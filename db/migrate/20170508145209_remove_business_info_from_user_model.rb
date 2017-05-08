class RemoveBusinessInfoFromUserModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :business_name
    remove_column :users, :business_street1
    remove_column :users, :business_street2
    remove_column :users, :business_city
    remove_column :users, :business_state
    remove_column :users, :business_phone
  end
end
