class AddBroadcastIdToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :broadcast_id, :string
  end
end
