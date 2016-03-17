class AddCaptureDateToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :capture_date, :datetime
  end
end
