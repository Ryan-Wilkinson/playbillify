class AddMultipleDatesToEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :date, :start_date
    add_column :events, :end_date, :date
  end
end

