class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :admin_id
      t.string :photo_url

      t.timestamps
    end
  end
end
