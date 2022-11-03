class AddDetailsToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :position_title, :string
    add_column :admins, :privilege_level, :integer
    add_column :admins, :preferred_name, :string
    add_column :admins, :send_emails, :boolean
  end
end
