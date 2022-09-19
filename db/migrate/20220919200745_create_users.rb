class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :auth_id
      t.string :position_title
      t.boolean :priviledged
      t.string :preferred_name

      t.timestamps
    end
  end
end
