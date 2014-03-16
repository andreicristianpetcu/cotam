class AddLatLongToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lat, :float, :precision => 15, :scale => 10, :default => 52.14
    add_column :events, :long, :float, :precision => 15, :scale => 10, :default => 21.1
  end
end
