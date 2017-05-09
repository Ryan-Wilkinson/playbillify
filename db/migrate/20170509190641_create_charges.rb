class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.string :customer
      t.integer :amount
      t.string :description
      t.string :currency

      t.timestamps
    end
  end
end
