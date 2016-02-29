class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.integer :chapter
      t.string :subject

      t.timestamps null: false
    end
  end
end
