class AddStreamNameToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :stream_name, :string
  end
end
