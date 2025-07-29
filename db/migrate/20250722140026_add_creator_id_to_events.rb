class AddCreatorIdToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :creator_id, :integer
    add_foreign_key :event, :users, column: :creator_id
  end
end
