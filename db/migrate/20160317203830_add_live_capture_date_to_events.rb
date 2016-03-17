class AddLiveCaptureDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :live_capture_date, :datetime
  end
end
