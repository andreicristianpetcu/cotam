class AddVisibleToEvent < ActiveRecord::Migration
  def change
    add_column :events, :visible, :boolean, default: false
  end
end
