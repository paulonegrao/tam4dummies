class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.string :token
      t.references :stream, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
