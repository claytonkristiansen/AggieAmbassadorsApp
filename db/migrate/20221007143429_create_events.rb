class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.time :event_time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
