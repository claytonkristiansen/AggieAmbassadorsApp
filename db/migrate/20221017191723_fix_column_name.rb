class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendance_records, :user_id, :admin_id
  end
end
