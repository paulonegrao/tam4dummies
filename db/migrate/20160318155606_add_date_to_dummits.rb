class AddDateToDummits < ActiveRecord::Migration
  def change
    add_column :dummits, :date, :string
  end
end
