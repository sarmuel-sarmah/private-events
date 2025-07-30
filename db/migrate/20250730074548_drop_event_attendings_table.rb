class DropEventAttendingsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :event_attendings
  end
end
