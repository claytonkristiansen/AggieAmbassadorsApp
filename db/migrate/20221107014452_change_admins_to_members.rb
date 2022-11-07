class ChangeAdminsToMembers < ActiveRecord::Migration[6.1]
  def change
    rename_table :admins, :members
  end
end
