class ChangeAdminIdToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :organizations, :admin_id, :user_id
  end
end
