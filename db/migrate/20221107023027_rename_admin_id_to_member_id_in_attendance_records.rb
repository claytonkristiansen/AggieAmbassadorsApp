class RenameAdminIdToMemberIdInAttendanceRecords < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendance_records, :admin_id, :member_id
  end
end
