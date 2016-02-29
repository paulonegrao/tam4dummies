class AddLiveYtIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :live_yt_id, :string
  end
end
