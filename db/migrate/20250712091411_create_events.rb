class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.datetime :date

      t.timestamps
    end
  end
end
