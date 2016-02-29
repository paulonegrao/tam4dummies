class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :live_id

      t.timestamps null: false
    end
  end
end
