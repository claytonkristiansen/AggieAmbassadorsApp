class CreateAttendanceRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :attendance_records do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :confirmed_attending
      t.timestamp :time_confirmed
      t.string :confirmation_link
      t.boolean :attended

      t.timestamps
    end
  end
end
