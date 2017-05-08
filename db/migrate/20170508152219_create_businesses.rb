class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :business_address1
      t.string :business_address2
      t.string :business_city
      t.string :business_state
      t.string :business_zip
      t.string :business_phone
      t.integer :user_id

      t.timestamps
    end
  end
end
