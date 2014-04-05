class AddSelectorsToEventDataSources < ActiveRecord::Migration
  def change
    add_column :event_data_sources, :name_selector, :string
    add_column :event_data_sources, :item_selector, :string
  end
end
