class CreateDummits < ActiveRecord::Migration
  def change
    create_table :dummits do |t|
      t.string :title
      t.text :body
      t.references :stream, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
