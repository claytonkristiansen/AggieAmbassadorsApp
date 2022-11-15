class AddLocationToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :location_id, :integer
  end
end
