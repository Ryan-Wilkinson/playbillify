class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :venue
      t.string :city
      t.string :state
      t.integer :organization_id
      t.integer :estimated_attendees
      t.string :photo_url
      t.date :deadline
      t.integer :user_id

      t.timestamps
    end
  end
end
