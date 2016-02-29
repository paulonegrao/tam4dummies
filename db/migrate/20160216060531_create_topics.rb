class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :number
      t.string :title

      t.timestamps null: false
    end
  end
end
