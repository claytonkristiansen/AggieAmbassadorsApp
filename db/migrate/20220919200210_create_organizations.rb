class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :contact_title

      t.timestamps
    end
  end
end
