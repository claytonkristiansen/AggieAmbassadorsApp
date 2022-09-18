class RemoveColumnsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :FirstName, :string
    remove_column :users, :LastName, :string
    remove_column :users, :SessionKey, :string
    remove_column :users, :AccountType, :string
  end
end
