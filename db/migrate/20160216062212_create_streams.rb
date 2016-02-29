class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :timestamp
      t.text :description
      t.references :lecture, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
